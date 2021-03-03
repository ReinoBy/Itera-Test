pageextension 50100 "SOL CustomerCardBookExtension" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("SOL Favourite Book Nr"; Rec."SOL Favourite Book Nr")
            {
                ApplicationArea = All;
            }
        }
    }

}