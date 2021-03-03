codeunit 50102 UpgradeCode
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    var
        Book: Record "SOL Book";
        Customer: Record Customer;

    begin
        Book.Reset();
        if not Book.FindFirst() then
            exit;

        Customer.Reset();
        if not Customer.IsEmpty then
            Customer.ModifyAll("SOL Favourite Book Nr", Book."No.");

    end;
}