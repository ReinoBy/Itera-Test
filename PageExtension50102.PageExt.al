pageextension 50102 "SOL PageExtension50102" extends "Customer List"
{
    layout
    {
        modify("Responsibility Center")
        {
            Visible = false;
        }
        addafter(Name)
        {
            field("SOL City46853"; Rec.City)
            {
                ApplicationArea = All;
            }
        }
    }
}
