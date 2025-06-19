<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/SignupPage">
        <html>
        <head>
            <title>Signup - SwiftBuy</title>
            <style>
                body {
                    font-family: 'Arial', sans-serif;
                    margin: 0;
                    padding: 0;
                    background: linear-gradient(135deg, #1abc9c, #16a085);
                    color: #fff;
                }
                .container {
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    justify-content: center;
                    height: 100vh;
                }
                .form-card {
                    background: #ffffff;
                    border-radius: 10px;
                    padding: 20px;
                    width: 400px;
                    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
                    color: #333;
                }
                h1 {
                    font-size: 24px;
                    text-align: center;
                    color: #333;
                }
                p {
                    text-align: center;
                    color: #555;
                    margin-bottom: 20px;
                }
                label {
                    display: block;
                    margin: 10px 0 5px;
                    font-weight: bold;
                }
                input {
                    width: 100%;
                    padding: 10px;
                    margin-bottom: 15px;
                    border: 1px solid #ccc;
                    border-radius: 5px;
                }
                button {
                    width: 100%;
                    background: #1abc9c;
                    color: white;
                    padding: 10px;
                    font-size: 16px;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                }
                button:hover {
                    background: #16a085;
                }
                .link-btn {
                    margin-top: 10px;
                    text-align: center;
                    display: block;
                    color: #1abc9c;
                    text-decoration: none;
                }
                .link-btn:hover {
                    text-decoration: underline;
                }
            </style>
        </head>
        <body>
            <div class="container">
                <div class="form-card">
                    <h1><xsl:value-of select="Title" /></h1>
                    <p><xsl:value-of select="Description" /></p>
                    <form>
                        <xsl:for-each select="Fields/Field">
                            <label><xsl:value-of select="Label" /></label>
                            <input type="{Input/@type}" placeholder="{Input/@placeholder}" />
                        </xsl:for-each>
                        <xsl:for-each select="Buttons/Button">
                            <xsl:choose>
                                <xsl:when test="@action='submit'">
                                    <button type="submit"><xsl:value-of select="." /></button>
                                </xsl:when>
                                <xsl:otherwise>
                                    <a class="link-btn" href="{@target}"><xsl:value-of select="." /></a>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </form>
                </div>
            </div>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
