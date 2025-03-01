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
            action(GetMatchBtn)
            {
                Caption = 'Get Match';
                Image = TextFieldConfirm;
                ToolTip = 'Executes the Get Match action.';
                trigger OnAction()
                begin
                    GetMatch();
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
        RegexOptions.IgnoreCase := true;
        Regex.Regex('\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b', RegexOptions);
        Regex.Match(Rec."Text Input", Matches);

        if Matches.FindSet() then
            repeat
                Message(Matches.ReadValue());
            until Matches.Next() = 0;
    end;
}
