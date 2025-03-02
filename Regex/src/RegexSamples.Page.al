page 52000 "Regex Samples"
{
    ApplicationArea = All;
    Caption = 'Regex Samples';
    PageType = List;
    SourceTable = "Regex Sample";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                }
                field("Text Input"; Rec."Text Input")
                {
                    ToolTip = 'Specifies the value of the Regex Input field.', Comment = '%';
                }
                field("Regex Pattern"; Rec."Regex Pattern")
                {
                    ToolTip = 'Specifies the value of the Regex Pattern field.', Comment = '%';
                }
                field("Regex Ignore Case"; Rec."Regex Ignore Case")
                {
                    ToolTip = 'Specifies the value of the Regex Ignore Case field.', Comment = '%';
                }
                field("Text Output"; Rec."Text Output")
                {
                    ToolTip = 'Specifies the value of the Text Output field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GetMatchAction)
            {
                Caption = 'Get Match';
                Image = TextFieldConfirm;
                ToolTip = 'Executes the Get Match action.';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    GetMatch();
                end;
            }
            action(ConvertToTestMailAddressAction)
            {
                Caption = 'Convert To Test Mail Address';
                Image = TextFieldConfirm;
                ToolTip = 'Executes the Convert To Test Mail Address action.';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    CreateTestMailAddress: Codeunit "Create Test Mail Address";
                begin
                    Rec."Text Output" := CreateTestMailAddress.ConvertEmailAddressToTest('businesscentralex@gmail.com', Rec."Text Input");
                    Rec.Modify();
                end;
            }
        }
    }

    local procedure GetMatch()
    var
        Regex: Codeunit Regex;
        RegexOptions: Record "Regex Options" temporary;
        Matches: Record Matches temporary;
    begin
        RegexOptions.IgnoreCase := Rec."Regex Ignore Case";
        Regex.Regex(Rec."Regex Pattern", RegexOptions);
        //Regex.Regex('\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b', RegexOptions);
        Regex.Match(Rec."Text Input", Matches);

        if Matches.FindSet() then
            repeat
                Rec."Text Output" += Matches.ReadValue() + '\';
            until Matches.Next() = 0;
        Rec.Modify();

        Message((Rec."Text Output"));
    end;
}
