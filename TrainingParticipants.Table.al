table 50102 "SOL TrainingParticipants"
{

    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Course No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Employee No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Employee Name"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Employee."Last Name" where("Employee No. Filter" = field("Employee No.")));
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Employee No.")
        {
            Clustered = true;
        }
    }

}