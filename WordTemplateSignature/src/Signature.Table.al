table 52010 Signature
{
    Caption = 'Signature';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "E-Mail"; Text[80])
        {
            Caption = 'E-Mail';
        }
        field(10; "User Id"; Code[50])
        {
            Caption = 'User Id';
            TableRelation = User;
        }
        field(20; Name; Text[80])
        {
            Caption = 'Name';
        }
        field(21; Title; Text[80])
        {
            Caption = 'Title';
        }
        field(22; "Phone No."; Text[80])
        {
            Caption = 'Phone No.';
        }
        field(50; "Word Template"; Code[30])
        {
            Caption = 'Word Template';
            TableRelation = "Word Template";
        }
    }
    keys
    {
        key(PK; "E-Mail")
        {
            Clustered = true;
        }
    }
}
