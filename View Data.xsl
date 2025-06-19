<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:company="http://www.example.com/company">
<xsl:output method="html" encoding="UTF-8" indent="yes"/>
<xsl:template match="/company:Company">
        <html>
            <head>
                <title>SwiftBuy E-Commerce</title>
                <style>
                    table {
                        width: 100%;
                        border-collapse: collapse;
                    }
                    th, td {
                        padding: 8px;
                        text-align: left;
                        border: 1px solid #ddd;
                    }
                    th {
                        background-color: #f2f2f2;
                    }
                </style>
            </head>
            <body>

                <h2>Company Information</h2>
                <table>
                    <tr>
                        <th>Field</th>
                        <th>Value</th>
                    </tr>
                    <tr>
                        <td>ID</td>
                        <td><xsl:value-of select="company:CompanyInfo/company:Id"/></td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td><xsl:value-of select="company:CompanyInfo/company:Name"/></td>
                    </tr>
                    <tr>
                        <td>CEO</td>
                        <td><xsl:value-of select="company:CompanyInfo/company:Ceo"/></td>
                    </tr>
                    <tr>
                        <td>Website</td>
                        <td><xsl:value-of select="company:CompanyInfo/company:Website"/></td>
                    </tr>
                </table>

                <h2>Departments</h2>
                <table>
                    <tr>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                    </tr>
                    <xsl:for-each select="company:CompanyInfo/company:Departments/company:Department">
                        <tr>
                            <td><xsl:value-of select="company:Name"/></td>
                            <td><xsl:value-of select="company:Phone"/></td>
                            <td><xsl:value-of select="company:Email"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                
                <h2>Business Hours</h2>
                <table>
                    <tr>
                        <th>Day</th>
                        <th>Open</th>
                        <th>Close</th>
                    </tr>
                    <xsl:for-each select="company:CompanyInfo/company:BusinessHours/company:OpeningHours">
                        <tr>
                            <td><xsl:value-of select="company:Day"/></td>
                            <td><xsl:value-of select="company:Open"/></td>
                            <td><xsl:value-of select="company:Close"/></td>
                        </tr>
                    </xsl:for-each>
                </table>

                <h2>Social Media</h2>
                <table>
                    <tr>
                        <td>Facebook</td>
                        <td><a href="{company:CompanyInfo/company:SocialMedia/company:Facebook}">Facebook</a></td>
                    </tr>
                    <tr>
                        <td>Twitter</td>
                        <td><a href="{company:CompanyInfo/company:SocialMedia/company:Twitter}">Twitter</a></td>
                    </tr>
                    <tr>
                        <td>Instagram</td>
                        <td><a href="{company:CompanyInfo/company:SocialMedia/company:Instagram}">Instagram</a></td>
                    </tr>
                    <tr>
                        <td>LinkedIn</td>
                        <td><a href="{company:CompanyInfo/company:SocialMedia/company:LinkedIn}">LinkedIn</a></td>
                    </tr>
                </table>

            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
