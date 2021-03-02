tableextension 50100 "SOL CustomerBookExtension" extends Customer
{
    fields
    {
        field(50100; "SOL Favourite Book No."; Code[20])
        {
            Caption = 'Favourite Book';
            DataClassification = ToBeClassified;

        }
    }
}