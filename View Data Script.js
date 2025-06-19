function loadCompanyData() {
    console.log("Button clicked, starting XMLHttpRequest...");

    const xhr = new XMLHttpRequest();
    xhr.open("GET", "your-xml-file.xml", true); // Ensure this points to the correct XML file path

    xhr.onload = function () {
        console.log("XHR loaded:", xhr.status); // Log status code for debugging
        if (xhr.status === 200) {
            const xmlDoc = xhr.responseXML;
            console.log("XML response:", xmlDoc); // Log XML content to check it

            const companyData = document.getElementById("company-data");
            companyData.innerHTML = ""; // Clear previous content

            const nsResolver = xmlDoc.createNSResolver(xmlDoc.documentElement);

            // XPath function to handle namespace
            const xpath = (query) => xmlDoc.evaluate(query, xmlDoc, nsResolver, XPathResult.STRING_TYPE, null).stringValue;

            // Extract and display company information
            const name = xpath("//*[local-name()='CompanyInfo']/*[local-name()='Name']");
            console.log("Company Name:", name);

            const ceo = xpath("//*[local-name()='CompanyInfo']/*[local-name()='Ceo']");
            const website = xpath("//*[local-name()='CompanyInfo']/*[local-name()='Website']");
            const phone = xpath("//*[local-name()='CompanyInfo']/*[local-name()='Contact']/*[local-name()='Phone']");
            const email = xpath("//*[local-name()='CompanyInfo']/*[local-name()='Contact']/*[local-name()='Email']");

            const companyInfo = `
                <div class="info">
                    <h3>${name}</h3>
                    <p><strong>CEO:</strong> ${ceo}</p>
                    <p><strong>Contact:</strong> ${phone}, ${email}</p>
                    <p><strong>Website:</strong> <a href="https://${website}" target="_blank">${website}</a></p>
                </div>
            `;

            companyData.innerHTML = companyInfo;
        } else {
            console.error("Failed to load XML file. Status:", xhr.status); // Log if status is not 200
        }
    };

    xhr.onerror = function () {
        console.error("XHR request error"); // Log any errors in the request
    };

    xhr.send();
}
