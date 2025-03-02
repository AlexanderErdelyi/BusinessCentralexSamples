codeunit 52010 "Signature Handler"
{
    procedure GetFilledSignatureFromWordTemplate(EMail: Text[80]) SignatureText: Text
    var
        Signature: Record Signature;
        WordTemplate: Codeunit "Word Template";
        DummyRecordVariant: Variant;
        InStr: InStream;
    begin
        if not Signature.Get(EMail) then
            exit;

        SetDummyRecordVariant(Signature.RecordId(), DummyRecordVariant);
        WordTemplate.Load(Signature."Word Template");
        WordTemplate.Merge(DummyRecordVariant, false, "Word Templates Save Format"::Html);
        WordTemplate.GetDocument(InStr);
        InStr.ResetPosition();
        InStr.Read(SignatureText);
    end;

    local procedure SetDummyRecordVariant(RecId: RecordId; var DummyRecordVariant: Variant)
    var
        Signature: Record Signature;
    begin
        case RecId.TableNo of
            Database::Signature:
                begin
                    Signature.Get(RecId);
                    Signature.SetRecFilter();
                    DummyRecordVariant := Signature;
                end;
        end;
    end;

}
