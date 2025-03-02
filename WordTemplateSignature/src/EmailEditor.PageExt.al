pageextension 52010 "Email Editor" extends "Email Editor"
{
    actions
    {
        addbefore(WordTemplate)
        {
            action(AddSignatureAction)
            {
                ApplicationArea = All;
                Caption = 'Add Signature';
                Image = Signature;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Add a signature to the email.';

                trigger OnAction()
                var
                    SignatureHandler: Codeunit "Signature Handler";
                    EmailMessage: Codeunit "Email Message";
                    EmailOutbox: Record "Email Outbox";
                    EmailAccount: Codeunit "Email Account";
                    EmailAccountTmp: Record "Email Account" temporary;
                begin
                    EmailAccount.GetAllAccounts(EmailAccountTmp);
                    EmailAccountTmp.Get(Rec.GetAccountId(), Rec.GetConnector());

                    EmailMessage := GetEmailMessage();
                    EmailMessage.AppendToBody(SignatureHandler.GetFilledSignatureFromWordTemplate(EmailAccountTmp."Email Address"));
                end;
            }
        }
    }
}
