table 50102 "SOL TrainingParticipants"
{

    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Course No."; Code[20])
        {
            Caption = 'No.', Comment = 'et-EE=Number';

            DataClassification = ToBeClassified;
        }
        field(2; "Employee No."; Code[20])
        {
            Caption = 'Employee No.', Comment = 'et-EE=Töötaja number';
            TableRelation = Employee;
            DataClassification = ToBeClassified;
        }
        field(3; "Employee Name"; Text[50])
        {
            Caption = 'Employee Name', Comment = 'et-EE=Töötaja nimi';

            FieldClass = FlowField;
            CalcFormula = lookup(Employee."Last Name" where("No." = field("Employee No.")));
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Course No.", "Employee No.")
        {
            Clustered = true;
        }
    }

}