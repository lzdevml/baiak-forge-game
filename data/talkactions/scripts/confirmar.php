<form name="contactform" method="post" action="enviar.php">
<table width="450px">
        <tr>
                <td valign="top">
                        <label for="character">Character Name:</label>
                </td>
                <td valign="top">
                        <input  type="text" name="character" maxlength="50" size="30">
                </td>
        </tr>
        <tr>
                <td valign="top">
                        <label for="valordoado">Valor Doado:</label>
                </td>
                <td valign="top">
                        <input  type="text" name="valordoado" maxlength="50" size="30">
                </td>
        </tr>
        <tr>  
                <td valign="top">
                        <label for="forma">Forma de Doa&ccedil;&atilde;o:</label>
                </td>
                <td valign="top">
                        <select name="forma">  
                             <option>Selecione...</option>  
                             <option>Pagseguro</option>  
                             <option>Paypal</option>  
                             <option>Moip</option>  
                             <option>Banco do Brasil</option>  
                             <option>Caixa Enconomica</option>  
                             <option>Bradesco</option>  
                             <option>Itau</option>  
                        </select>  
                </td>
        </tr>  
        <tr>
                <td valign="top">
                        <label for="email">Email:</label>
                </td>
                <td valign="top">
                        <input  type="text" name="email" maxlength="80" size="30">
                </td>
        </tr>
        <tr>
                <td valign="top">
                        <label for="data">Data da Doa&ccedil;&atilde;o:</label>
                </td>
                <td valign="top">
                        <input  type="text" name="data" maxlength="30" size="30">
                </td>
        </tr>
        <tr>
                <td valign="top">
                        <label for="observacoes">Observa&ccedil;&otilde;es:</label>
                </td>
                <td valign="top">
                        <textarea  name="observacoes" maxlength="1000" cols="25" rows="6"></textarea>
                </td>
        </tr>
        <tr>
                <td colspan="2" style="text-align:center">
                        <input type="submit" value="Submit">
                </td>
        </tr>
</table>
</form>