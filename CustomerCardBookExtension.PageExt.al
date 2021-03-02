pageextension 50100 "SOL CustomerCardBookExtension" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("SOL Favourite Book No."; Rec."SOL Favourite Book No.")
            {
                ApplicationArea = All;
            }
        }
    }


}