pageextension 50101 "HumanResoursesPageExtension" extends "Human Resources Setup"
{
    layout
    {
        addlast(Numbering)
        {
            field("SOL Sol Training No."; Rec."Sol Training No.")
            {
                ApplicationArea = All;
            }
        }
    }


}