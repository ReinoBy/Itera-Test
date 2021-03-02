profile "SOL MyProfile"
{
    Caption = 'My Profile';
    RoleCenter = "Order Processor Role Center";
    Customizations = MyCustomizations;

}

pagecustomization MyCustomizations customizes "Customer List"
{
    layout
    {
        modify("Responsibility Center")
        {
            Visible = false;
        }
    }

}