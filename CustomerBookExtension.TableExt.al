tableextension 50100 "SOL CustomerBookExtension" extends Customer
{
    fields
    {
        field(50100; "SOL Favourite Book Nr"; Code[20])
        {
            Caption = 'Favourite Book';
            DataClassification = ToBeClassified;
            TableRelation = "SOL Book"."No.";
        }
    }
    trigger OnAfterInsert()
    var
        CustomerCode: Codeunit "SOL Customercode";
    begin
        CustomerCode.CelebrateCustomer(Rec, 'Congrats from the table extension!');
    end;
}