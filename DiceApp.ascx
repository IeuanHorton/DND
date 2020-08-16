<%@ Control Language="C#" ClassName="WebUserControl"%>

<div>
    <asp:TextBox ID="txtAmount" runat="server" Width="30px"></asp:TextBox>
    D
    <asp:TextBox ID="txtRandom" runat="server" Width="30px"></asp:TextBox>
    <asp:Button ID="btnRoll" runat="server" Text="Roll" OnClick="btnRoll_Click" />

    <asp:TextBox ID="txtOutput" runat="server"></asp:TextBox>
</div>


<script runat="server">

    protected void btnRoll_Click(object sender, EventArgs e)
    {
        if(checkIfNumber(txtRandom.Text) & checkIfNumber(txtAmount.Text))
        {
            var rand = new Random();
            int random = int.Parse(txtRandom.Text);
            int amount = int.Parse(txtAmount.Text);
            int total = 0;
            string output = "";

            for(int x = 0; x < amount; x++)
            {
                int randomNumber = rand.Next(random);
                total += randomNumber;
                output += randomNumber + ",";
            }
            txtOutput.Text = output + " Total: " + total;
        }
        else
        {
            txtOutput.Text = "Please enter numbers into the text boxes.";
        }
    }

    private bool checkIfNumber(string number)
    {
        try
        {
            int.Parse(number);
            return true;
        }
        catch
        {
            return false;
        }
    }
</script>
