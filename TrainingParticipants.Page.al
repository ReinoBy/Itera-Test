page 50104 "SOL TrainingParticipants"
{
    PageType = ListPart;
    SourceTable = "SOL TrainingParticipants";

    layout
    {
        area(Content)
        {
            repeater(Participants)
            {
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }


}