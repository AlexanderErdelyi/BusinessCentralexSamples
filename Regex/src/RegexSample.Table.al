table 52000 "Regex Sample"
{
    Caption = 'Regex';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(10; "Text Input"; Text[1024])
        {
            Caption = 'Text Input';
        }
        field(11; "Regex Pattern"; Text[1024])
        {
            Caption = 'Regex Pattern';
        }
        field(12; "Regex Ignore Case"; Boolean)
        {
            Caption = 'Regex Ignore Case';
        }
        field(13; "Text Output"; Text[1024])
        {
            Caption = 'Text Output';
        }

    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
