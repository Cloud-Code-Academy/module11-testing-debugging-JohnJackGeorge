/*
TestDebuggingTest Class Description:
* 
* Complete the following exercises based on the tests.
* Create triggers on Lead.
*
* Lead trigger should do the following:
* 1. Lead Title Normalization
* 2. Calculate the Lead Account Lead Score.
* 3. Auto-Convert Inserted/Updated Leads based on Lead email Matching 1 Contact Email address for the existing Account.
*/
@IsTest
public with sharing class TestDebuggingTest {

    /* 
	 * Question 1 Vice President
	 * Requirement Lead Title Normalization - handleTitleNormalization
	 * Occasionally, users input titles in a variety of ways. Streamline these titles for consistency:
	 *
	 * Criteria:
	 * - If the title contains terms such as 'vp', 'v.p.', or 'vice president',
	 *   change the title to 'Vice President'.
	 */
    @IsTest 
    static void testLeadTitleVicePresident() {
        // Prepare the test data
        Map<String, List<String>> typeToTitles = new Map<String, List<String>>{
            'Vice President' => new List<String>{'vp', 'v.p.', 'vice president', 'Vice President'}
        };
    
        List<Lead> lds = new List<Lead>();
    
        Integer i = 0;
        for(String type : typeToTitles.keySet()) {
            for(String title : typeToTitles.get(type)) {
                lds.add(new Lead(
                    LastName='Doe ' + (i+1), 
                    Company='Test Company ' + (i+1), 
                    Status='Open - Not Contacted',
                    Title=title, 
                    Email='john.doe' + (i+1) + '@gmail.com'
                ));
                i++;
            }
        }
        // Perform the test
        Test.startTest();
            insert lds;
        Test.stopTest();
    
        // Query the inserted Lead
        List<Lead> resultLead = [SELECT Title FROM Lead WHERE Id IN :lds];
        
        // Assert that the Title is 'Vice President'
        for (Integer j = 0; j < resultLead.size(); j++) {
            System.assertEquals('Vice President', resultLead[j].Title, 'The Vice President Title of the Lead is incorrect.');
        }
        // Assert that the number of Vice President Leads inserted is correct
        System.assertEquals(4, resultLead.size(), 'Number of Vice President leads inserted is incorrect.');
        
    }

    /* 
	 * Question 1 Manager
	 * Requirement Lead Title Normalization - handleTitleNormalization
	 * Occasionally, users input titles in a variety of ways. Streamline these titles for consistency:
	 *
	 * Criteria:
	 * - If the title contains terms like 'mgr', 'manage', or 'head of department',
	 *   change the title to 'Manager'.
	 */
    @IsTest 
    static void testLeadTitleManager() {
        // Prepare the test data
        Map<String, List<String>> typeToTitles = new Map<String, List<String>>{
            'Manager' => new List<String>{'mgr', 'manage', 'head of department', 'Manager'}
        };
    
        List<Lead> lds = new List<Lead>();
    
        Integer i = 0;
        for(String type : typeToTitles.keySet()) {
            for(String title : typeToTitles.get(type)) {
                lds.add(new Lead(
                    LastName='Doe ' + (i+1), 
                    Company='Test Company ' + (i+1), 
                    Status='Open - Not Contacted',
                    Title=title, 
                    Email='john.doe' + (i+1) + '@gmail.com'
                ));
                i++;
            }
        }
        // Perform the test
        Test.startTest();
            insert lds;
        Test.stopTest();
    
        // Query the inserted Lead
        List<Lead> resultLead = [SELECT Title FROM Lead WHERE Id IN :lds];
        
        // Assert that the Title is 'Manager'
        for (Integer j = 0; j < resultLead.size(); j++) {
            System.assertEquals('Manager', resultLead[j].Title, 'The Manager Title of the Lead is incorrect.');
        }
        // Assert that the number of Manager Leads inserted is correct
        System.assertEquals(4, resultLead.size(), 'Number of Manager leads inserted is incorrect.'); 
    }

    /* 
	 * Question 1 Executive
	 * Requirement Lead Title Normalization - handleTitleNormalization
	 * Occasionally, users input titles in a variety of ways. Streamline these titles for consistency:
	 *
	 * Criteria:
	 * - If the title contains terms like 'assist', 'deputy', or 'jr',
	 *   change the title to 'Assistant'.
	 */
    @IsTest 
    static void testLeadTitleExecutive() {
        // Prepare the test data
        Map<String, List<String>> typeToTitles = new Map<String, List<String>>{
            'Executive' => new List<String>{'exec', 'chief', 'head', 'Executive'}
        };
    
        List<Lead> lds = new List<Lead>();
    
        Integer i = 0;
        for(String type : typeToTitles.keySet()) {
            for(String title : typeToTitles.get(type)) {
                lds.add(new Lead(
                    LastName='Doe ' + (i+1), 
                    Company='Test Company ' + (i+1), 
                    Status='Open - Not Contacted',
                    Title=title, 
                    Email='john.doe' + (i+1) + '@gmail.com'
                ));
                i++;
            }
        }
        // Perform the test
        Test.startTest();
            insert lds;
        Test.stopTest();
    
        // Query the inserted Lead
        List<Lead> resultLead = [SELECT Title FROM Lead WHERE Id IN :lds];
        
        // Assert that the Title is 'Executive'
        for (Integer j = 0; j < resultLead.size(); j++) {
            System.assertEquals('Executive', resultLead[j].Title, 'The Executive Title of the Lead is incorrect.');
        }
        // Assert that the number of Executive Leads inserted is correct
        System.assertEquals(4, resultLead.size(), 'Number of Executive leads inserted is incorrect.');        
    }

    /* 
	 * Question 1 Assistant
	 * Requirement Lead Title Normalization - handleTitleNormalization
	 * Occasionally, users input titles in a variety of ways. Streamline these titles for consistency:
	 *
	 * Criteria:
	 * - If the title contains terms like 'assist', 'deputy', or 'jr',
	 *   change the title to 'Assistant'.
	 */
    @IsTest 
    static void testLeadTitleAssistant() {
        // Prepare the test data
        Map<String, List<String>> typeToTitles = new Map<String, List<String>>{
            'Assistant' => new List<String>{'assist', 'deputy', 'jr', 'Assistant'}
        };
    
        List<Lead> lds = new List<Lead>();
    
        Integer i = 0;
        for(String type : typeToTitles.keySet()) {
            for(String title : typeToTitles.get(type)) {
                lds.add(new Lead(
                    LastName='Doe ' + (i+1), 
                    Company='Test Company ' + (i+1), 
                    Status='Open - Not Contacted',
                    Title=title, 
                    Email='john.doe' + (i+1) + '@gmail.com'
                ));
                i++;
            }
        }
        // Perform the test
        Test.startTest();
            insert lds;
        Test.stopTest();
    
        // Query the inserted Lead
        List<Lead> resultLead = [SELECT Title FROM Lead WHERE Id IN :lds];
        
        // Assert that the Title is 'Assistant'
        for (Integer j = 0; j < resultLead.size(); j++) {
            System.assertEquals('Assistant', resultLead[j].Title, 'The Assistant Title of the Lead is incorrect.');
        }
        // Assert that the number of Assistant Leads inserted is correct
        System.assertEquals(4, resultLead.size(), 'Number of Assistant leads inserted is incorrect.');        
    }
    /* 
	 * Question 1 Null Title
	 * Requirement Lead Title Normalization - handleTitleNormalization
	 * Occasionally, users input titles in a variety of ways. Streamline these titles for consistency:
	 *
	 * Criteria:
	 * - If the title is null, do nothing.
	 */
    @IsTest 
    static void testLeadTitleNull() {
        // Prepare the test data
            
        // Create a test Lead
        Lead lds = new Lead(LastName = 'Jones 1', Status = 'Open - Not Contacted', LeadSource = 'Web', Company = 'Panera Bread 1', Email = 'jones1@panerabread.com', Phone = '542-558-8977', Industry = 'Restaurant');
                
        Test.startTest();
            insert lds;
        Test.stopTest();
    
        // Check that the Lead was created
        lds = [SELECT Title FROM Lead WHERE Id = :lds.Id];

        // Assert that the number of null Leads inserted is correct
        System.assertEquals(null, lds.title, 'Title of lead inserted is incorrect. Should be null.');        
    }

    /* 
	 * Question 2
	 * Requirement Auto Lead Scoring - handleAutoLeadScoring
	 * Implement logic to automatically assign scores to leads based on specific criteria.
	 * 18 should be highest possible score a lead can have.
	 *
	 * Criteria:
	 * - If the lead source is from the website and an email exists, increment score by 3 points.
	 * - If the lead provides a phone number, increment score by 5 points.
	 * - If the lead belongs to the 'Technology' industry, increment score by another 10 points.
	 */
    @IsTest 
    static void testLeadScore() {
        
        // Create test leads 
        List<Lead> testLeads = new List<Lead>();
        testLeads.add(new Lead(LastName = 'Shmo 1',  Title = 'Manager', Status = 'Open - Not Contacted', Company = 'Firehouse Subs 1',  LeadSource = '',    Email = '', Phone = '', Industry = 'Healthcare'));
        testLeads.add(new Lead(LastName = 'Shmo 2',  Title = 'Manager', Status = 'Open - Not Contacted', Company = 'Firehouse Subs 2',  LeadSource = 'Web', Email = 'Shmo2@gmail.com', Phone = '', Industry = 'Healthcare'));
        testLeads.add(new Lead(LastName = 'Shmo 3',  Title = 'Manager', Status = 'Open - Not Contacted', Company = 'Firehouse Subs 3',  LeadSource = 'Web', Email = '', Phone = '', Industry = 'Healthcare'));
        testLeads.add(new Lead(LastName = 'Shmo 4',  Title = 'Manager', Status = 'Open - Not Contacted', Company = 'Firehouse Subs 4',  LeadSource = '',    Email = 'Shmo4@gmail.com', Phone = '', Industry = 'Healthcare'));
        testLeads.add(new Lead(LastName = 'Shmo 5',  Title = 'Manager', Status = 'Open - Not Contacted', Company = 'Firehouse Subs 5',  LeadSource = '',    Email = '', Phone = '210-254-8377', Industry = 'Technology'));
        testLeads.add(new Lead(LastName = 'Shmo 6',  Title = 'Manager', Status = 'Open - Not Contacted', Company = 'Firehouse Subs 6',  LeadSource = 'Web', Email = 'Shmo6@gmail.com', Phone = '210-254-8377', Industry = 'Technology'));
        testLeads.add(new Lead(LastName = 'Shmo 7',  Title = 'Manager', Status = 'Open - Not Contacted', Company = 'Firehouse Subs 7',  LeadSource = 'Web', Email = '', Phone = '210-254-8377', Industry = 'Technology'));
        testLeads.add(new Lead(LastName = 'Shmo 8',  Title = 'Manager', Status = 'Open - Not Contacted', Company = 'Firehouse Subs 8',  LeadSource = '',    Email = 'Shmo8@gmail.com', Phone = '210-254-8377', Industry = 'Technology'));
        testLeads.add(new Lead(LastName = 'Shmo 9',  Title = 'Manager', Status = 'Open - Not Contacted', Company = 'Firehouse Subs 9',  LeadSource = '',    Email = '', Phone = '210-254-8377', Industry = 'Healthcare'));
        testLeads.add(new Lead(LastName = 'Shmo 10', Title = 'Manager', Status = 'Open - Not Contacted', Company = 'Firehouse Subs 10', LeadSource = 'Web', Email = 'Shmo10@gmail.com', Phone = '210-254-8377', Industry = 'Healthcare'));
        testLeads.add(new Lead(LastName = 'Shmo 11', Title = 'Manager', Status = 'Open - Not Contacted', Company = 'Firehouse Subs 11', LeadSource = 'Web', Email = '', Phone = '210-254-8377', Industry = 'Healthcare'));
        testLeads.add(new Lead(LastName = 'Shmo 12', Title = 'Manager', Status = 'Open - Not Contacted', Company = 'Firehouse Subs 12', LeadSource = '',    Email = 'Shmo12@gmail.com', Phone = '210-254-8377', Industry = 'Healthcare'));
        testLeads.add(new Lead(LastName = 'Shmo 13', Title = 'Manager', Status = 'Open - Not Contacted', Company = 'Firehouse Subs 13', LeadSource = '',    Email = '', Phone = '', Industry = 'Technology'));
        testLeads.add(new Lead(LastName = 'Shmo 14', Title = 'Manager', Status = 'Open - Not Contacted', Company = 'Firehouse Subs 14', LeadSource = 'Web', Email = 'Shmo14@gmail.com', Phone = '', Industry = 'Technology'));
        testLeads.add(new Lead(LastName = 'Shmo 15', Title = 'Manager', Status = 'Open - Not Contacted', Company = 'Firehouse Subs 15', LeadSource = 'Web', Email = '', Phone = '', Industry = 'Technology'));
        testLeads.add(new Lead(LastName = 'Shmo 16', Title = 'Manager', Status = 'Open - Not Contacted', Company = 'Firehouse Subs 16', LeadSource = '',    Email = 'Shmo16@gmail.com', Phone = '', Industry = 'Technology'));
        
        insert testLeads;

        // Verify 
        List<Lead> updatedLeads = [SELECT LastName, LeadSource, Email, Phone, Industry, Lead_Score__c FROM Lead WHERE Id IN :testLeads];

        for (Lead ld : updatedLeads) {
            if ((ld.LeadSource != 'Web' && ld.Email == null && ld.Phone == null && ld.Industry != 'Technology') ||           // Score should be 0
                (ld.LeadSource == 'Web' && ld.Email == null && ld.Phone == null && ld.Industry != 'Technology') ||
                (ld.LeadSource != 'Web' && ld.Email != null && ld.Phone == null && ld.Industry != 'Technology')) {   
                System.assertEquals(0, ld.Lead_Score__c, 'Lead Score should have been 0');
            } else if (ld.LeadSource == 'Web' && ld.Email != null && ld.Phone == null && ld.Industry != 'Technology') {   // Score should be 3
                System.assertEquals(3, ld.Lead_Score__c, 'Lead Score should have been 3');
            } else if ((ld.LeadSource != 'Web' && ld.Email == null && ld.Phone != null && ld.Industry != 'Technology') ||
                       (ld.LeadSource == 'Web' && ld.Email == null && ld.Phone != null && ld.Industry != 'Technology') ||
                       (ld.LeadSource != 'Web' && ld.Email != null && ld.Phone != null && ld.Industry != 'Technology')) {   // Score should be 5
                System.assertEquals(5, ld.Lead_Score__c, 'Lead Score should have been 5');
            } else if (ld.LeadSource == 'Web' && ld.Email != null && ld.Phone != null && ld.Industry != 'Technology') {   // Score should be 8
                System.assertEquals(8, ld.Lead_Score__c, 'Lead Score should have been 8');
            } else if ((ld.LeadSource != 'Web' && ld.Email == null && ld.Phone == null && ld.Industry == 'Technology') ||   
                       (ld.LeadSource == 'Web' && ld.Email == null && ld.Phone == null && ld.Industry == 'Technology') ||   
                       (ld.LeadSource != 'Web' && ld.Email != null && ld.Phone == null && ld.Industry == 'Technology')) {   // Score should be 10
                System.assertEquals(10, ld.Lead_Score__c, 'Lead Score should have been 10');  
            } else if (ld.LeadSource == 'Web' && ld.Email != null && ld.Phone == null && ld.Industry == 'Technology') {   // Score should be 13
                System.assertEquals(13, ld.Lead_Score__c, 'Lead Score should have been 13');            
            } else if ((ld.LeadSource != 'Web' && ld.Email == null && ld.Phone != null && ld.Industry == 'Technology') ||   
                       (ld.LeadSource == 'Web' && ld.Email == null && ld.Phone != null && ld.Industry == 'Technology') ||   
                       (ld.LeadSource != 'Web' && ld.Email != null && ld.Phone != null && ld.Industry == 'Technology')) {   // Score should be 15
                System.assertEquals(15, ld.Lead_Score__c, 'Lead Score should have been 15');
            } else if (ld.LeadSource == 'Web' && ld.Email != null && ld.Phone != null && ld.Industry == 'Technology') {   // Score should be 18
                System.assertEquals(18, ld.Lead_Score__c, 'Lead Score should have been 18');
            } else {
                System.assertEquals(0, ld.Lead_Score__c, 'Lead Score should have been 0');
            }
        }    
    }
    /* 
	 * Question 3 - Convert Lead with 'Convert' Button
     * 
	 * Requirement Automatic Lead Conversion Based on Email Match - handleLeadAutoConvert
	 * Whenever an existing Lead is converted by User clicking the 'Convert' Button,
	 *    validate that the Lead is Converted without failure.
	 * Use the Salesforce report Converted Lead to verify that the Lead was converted to the correct Contact.
	 *
	 * Criteria:
	 * - On Lead 'Convert' button is clicked, covert the Lead.
	*/
    @IsTest 
    static void testLeadAutoConvertClickConvertBtn() {
        //Test that Current Lead clicking 'Convert' button
        // Create a test Lead
        Lead testLead = new Lead(LastName = 'Jones 1', Title = 'Manager', Status = 'Open - Not Contacted', LeadSource = 'Web', 
                                Company = 'Panera Bread 1', Email = 'jones1@panerabread.com', Phone = '542-558-8977', Industry = 'Restaurant');
        
        Test.startTest();
            insert testLead;
        Test.stopTest();

        // Create a LeadConvert object
        Database.LeadConvert lc = new Database.LeadConvert();
        lc.setLeadId(testLead.Id);
        lc.setDoNotCreateOpportunity(true); // Assuming we don't want to create
        lc.setConvertedStatus('Closed - Converted'); // Set the converted status

        // Convert the Lead
        Database.LeadConvertResult lcr = Database.convertLead(lc);
        System.assert(lcr.isSuccess());

        // Check that the Lead has been converted
        testLead = [SELECT IsConverted FROM Lead WHERE Id = :testLead.Id];
        System.assert(testLead.IsConverted);
    }

    /* 
	 * Question 3 - Lead Insert Email with 0 Contacts with a matching Email Address, do not Auto-Convert
     *
  	 * Whenever an new Lead's email address is inserted,
	 *   and there are 0 Contacts with the same emall Address,
     *      Do not Auto-Convert
	 */

    @IsTest 
    static void testLeadNoAutoConvertInsertLead0DupContactEmail() {

        // This method will create a Lead with an Email Address that does\'nt match any Contact Email Address and WILL NOT Auto-Convert the Lead.')
        // Verify the Lead was NOT converted to Account and Contact
        
        /// Creates Initial Account and up to 2 Contacts
        String contactsEmailMatch = 'No'; // Creates 2 Contacts with different email addresses

        createInitialData(contactsEmailMatch);

        String LeadEmail = 'jimmy@bettercallsaul.com';

        // Create a test Lead 
        Lead testLead = new Lead(FirstName = 'Jimmy', LastName = 'McGill', Title = 'Partner', Status = 'Open - Not Contacted', 
            LeadSource = 'Web', Company = 'Saul Goodman and Associates', Phone = '542-558-8977', Industry = 'Consulting',
            Email = LeadEmail);
        
        Test.startTest();
            insert testLead;
        Test.stopTest();

        // Check that the Lead has NOT been converted
        testLead = [SELECT IsConverted FROM Lead WHERE Id = :testLead.Id];
        System.assert(!testLead.IsConverted,'Lead was converted');

        List<Contact> newContact = [SELECT Id, FirstName, LastName, Account.Name, Email FROM Contact WHERE LastName = 'McGill' and Email = :LeadEmail];

        // Check that the Contact has NOT been created
        System.assertequals(0,newContact.size(),'Contact was created');
    }

    /* 
     * Question 3 - Auto-convert Lead if inserted Lead has same Email as a current Contact
     * 
  	 * Whenever an new Lead's email address is inserted,
	 *   and there is 1 Contact with matching emall Address,
     *      Auto-Convert the Lead
	*/
    @IsTest 
    static void testLeadAutoConvertInsertLead1DupContactEmail() {

        // This method will create a Lead with an Email Address that matches 1 Contact Email Address and WILL Auto-Convert the Lead.');
        // Verify the Lead was converted to Account and Contact

        // Creates Initial Account and up to 2 Contacts
        String contactsEmailMatch = 'No';

        createInitialData(contactsEmailMatch);

        String LeadEmail = 'sales@hhm.com';

        // Create a test Lead 
        Lead testLead = new Lead(FirstName = 'Jimmy', LastName = 'McGill', Title = 'Partner', Status = 'Open - Not Contacted', 
            LeadSource = 'Web', Company = 'Saul Goodman and Associates', Phone = '542-558-8977', Industry = 'Consulting',
            Email = LeadEmail);
        
        // Convert the Lead;
        Test.startTest();
            insert testLead;
        Test.stopTest();

        // Check that the Lead has been converted
        testLead = [SELECT IsConverted FROM Lead WHERE Id = :testLead.Id];
        System.assert(testLead.IsConverted,'Lead was not converted');

        List<Contact> newContact = [SELECT Id, FirstName, LastName, Account.Name, Email FROM Contact WHERE LastName = 'McGill' and Email = :LeadEmail];

        // Check that the Contact has been created
        System.assertequals(1,newContact.size(),'Contact was not created');
    }    

    /* 
	 * Question 3 - Lead Inserted with Email matching multiple Contacts with duplicate Email Addressses, will not Auto-Convert
     *
  	 * Whenever an existing Lead's email address is updated,
	 *   and there are 2 Contacts with the same emall Address,
     *      Do not Auto-Convert
	 */
    @IsTest 
    static void testLeadNoAutoConvertInsertLead2DupContactEmail() {

        // This method will create a Lead with an Email Address matches 2 Contacts with matching Email Addresses and WILL NOT Auto-Convert the Lead.');
        // Verify the Lead was NOT converted to Account and Contact
        
        // Creates Initial Account and up to 2 Contacts
        String contactsEmailMatch = 'Yes';

        String LeadEmail = 'sales@hhm.com';

        createInitialData(contactsEmailMatch);

        // Create a test Lead 
        Lead testLead = new Lead(FirstName = 'Jimmy', LastName = 'McGill', Title = 'Partner', Status = 'Open - Not Contacted', 
            LeadSource = 'Web', Company = 'Saul Goodman and Associates', Phone = '542-558-8977', Industry = 'Consulting',
            Email = LeadEmail);
        
        Test.startTest();
            insert testLead;
        Test.stopTest();

        // Check that the Lead has NOT been converted
        testLead = [SELECT IsConverted FROM Lead WHERE Id = :testLead.Id];
        System.assert(!testLead.IsConverted,'Lead was converted');

        List<Contact> newContact = [SELECT Id, FirstName, LastName, Account.Name, Email FROM Contact WHERE LastName = 'McGill' and Email = :LeadEmail];

        // Check that the Contact has NOT been converted
        System.assertequals(0,newContact.size(),'Contact was created');
    }

    /* 
	 * Question 3 - Lead Updated Email with 0 Contacts with a matching Email Address, mot not Auto-Convert
     *
  	 * Whenever an existing Lead's email address is updated,
	 *   and there are 0 Contacts with the same emall Address,
     *      Do not Auto-Convert
	 */

    @IsTest 
    static void testLeadNoAutoConvertUpdateLead0DupContactEmail() {

        // This method will create a Lead with an Email Address that doesn\'t match any Contact Email Addresses,'); 
        //    updates Lead Email address that still doesn't match any Contact Email Address'); 
        //    and WILL NOT Auto-Convert the Lead.');

        // Verify the Lead was converted to Account and Contact
        // Creates Initial Account and up to 2 Contacts
        String contactsEmailMatch = 'No';

        String LeadEmail = 'jimmy@bettercallsaul.com';
        String UpdateLeadEmail = 'sales3@hhm.com';

        createInitialData(contactsEmailMatch);

        // Create a test Lead with different Email as the Current Contact
        Lead testLead = new Lead(FirstName = 'Jimmy', LastName = 'McGill', Title = 'Partner', Status = 'Open - Not Contacted', 
            LeadSource = 'Web', Company = 'Saul Goodman and Associates', Phone = '542-558-8977', Industry = 'Consulting',
            Email = LeadEmail);
        
        Test.startTest();
            insert testLead;
        Test.stopTest();

        testLead.Email = UpdateLeadEmail;
        Update testLead;

        // Check that the Lead has been converted
        testLead = [SELECT IsConverted FROM Lead WHERE Id = :testLead.Id];
        System.assert(!testLead.IsConverted,'Lead was converted');

        // Check that the Contact was not converted
        List<Contact> newContact = [SELECT Id, FirstName, LastName, Account.Name, Email FROM Contact WHERE LastName = 'McGill' and Email = :UpdateLeadEmail];
        System.assertequals(0,newContact.size(),'Contact was created');
    }

    /* 
	 * Question 3 - Auto-convert Lead if updated Lead email and matches a current Contact's email 
	 *
  	 * Whenever an existing Lead's email address is updated,
	 *   and there is 2 Contact with matching emall Address,
     *      Auto-Convert the Lead
	*/
    @IsTest 
    static void testLeadAutoConvertUpdateLead1DupContactEmail() {
        
        // This method will create a Lead with an Email Address that doesn't match any Contact Email Address

        // This method will create a Lead with an Email Address that doesn't match any Contact Email Addresses,
        //    updates Lead Email address to match 1 Contact Email Address 
        //    and WILL Auto-Convert the Lead.

        // Verify the Lead was converted to Account and Contact
        // Creates Initial Account and 2 Contacts
        String contactsEmailMatch = 'No';

        String LeadEmail = 'jimmy@bettercallsaul.com';
        String UpdateLeadEmail = 'sales@hhm.com';

        createInitialData(contactsEmailMatch);

        // Create a test Lead with different Email as the Current Contact
        Lead testLead = new Lead(FirstName = 'Jimmy', LastName = 'McGill', Title = 'Partner', Status = 'Open - Not Contacted', 
            LeadSource = 'Web', Company = 'Saul Goodman and Associates', Phone = '542-558-8977', Industry = 'Consulting',
            Email = LeadEmail);
        
        Test.startTest();
            insert testLead;
        Test.stopTest();

        testLead.Email = UpdateLeadEmail;
        Update testLead;

        // Check that the Lead has been converted
        testLead = [SELECT IsConverted FROM Lead WHERE Id = :testLead.Id];
        System.assert(testLead.IsConverted,'Lead was not converted');

        // Check that the Contact has been converted
        List<Contact> newContact = [SELECT Id, FirstName, LastName, Account.Name, Email FROM Contact WHERE LastName = 'McGill' and Email = :UpdateLeadEmail];
        System.assertequals(1,newContact.size(),'Contact was not created');
    }

    /* 
	 * Question 3 - Lead Updated to Email = to multiple Contacts with duplicate Emal Address will not Auto-Convert
     *
  	 * Whenever an existing Lead's email address is updated,
	 *   and there are 2 Contacts with the same emall Address,
     *      Do not Auto-Convert
	 */
    @IsTest 
    static void testLeadNoAutoConvertUpdateLead2DupContactEmail() {

        // This method will create a Lead with an Email Address that doesn\'t match multiple Contact Email Addresses,
        //    updates Lead Email address to match 1 Contact Email Address 
        //    and WILL NOT Auto-Convert the Lead.
        
        // Verify the Lead was converted to Account and Contact      
        // Creates Initial Account and up to 2 Contacts
        String contactsEmailMatch = 'Yes';

        String LeadEmail = 'jimmy@bettercallsaul.com';
        String UpdateLeadEmail = 'sales@hhm.com';

        createInitialData(contactsEmailMatch);

        // Create a test Lead with different Email as the Current Contact
        Lead testLead = new Lead(FirstName = 'Jimmy', LastName = 'McGill', Title = 'Partner', Status = 'Open - Not Contacted', 
            LeadSource = 'Web', Company = 'Saul Goodman and Associates', Phone = '542-558-8977', Industry = 'Consulting',
            Email = 'jimmy@bettercallsaul.com');
        
        Test.startTest();
            insert testLead;
        Test.stopTest();

        testLead.Email = UpdateLeadEmail;
        Update testLead;

        // Check that the Lead has been converted
        testLead = [SELECT IsConverted FROM Lead WHERE Id = :testLead.Id];
        System.assert(!testLead.IsConverted,'Lead was converted');

        // Check that the Contact has been converted
        List<Contact> newContact = [SELECT Id, FirstName, LastName, Account.Name, Email FROM Contact WHERE LastName = 'McGill' and Email = :UpdateLeadEmail];
        System.assertequals(0,newContact.size(),'Contact was created');
    }
    
    /* 
     * This method will create Test Contacts for the Auto-Convert Lead Test cases
     * Question 3 - Auto-convert Lead if inserted Lead has same Email as a current Contact
     * 
	 * Contact 1
     *  Howard Hamlin, Senoir Pertner at HHM with 'sales@hhm.com' Email Address
     * 
     * Contact 2
     *  Kim Wexler, Partner at HHM with 'sales1@hhm.com' Email Address
     * 
     * parms:
     *   contactsEmailMatch 
     *      If 'Yes', Kim Wexler's email address is set to 'sales@hhm.com'
     *      If 'No', Kim Wexler's email address is set to 'sales1@hhm.com'
	 */
	public Static void createInitialData(String contactsEmailMatch) {

        // Create a test Account
        Account acc = new Account(Name = 'HHM', Industry = 'Consulting');
        insert acc;

        String contactEmail1 = 'sales@hhm.com';
        String contactEmail2 = 'sales1@hhm.com';
        String LeadEmail = 'sales1@hhm.com';

        If(contactsEmailMatch == 'Yes') {
            contactEmail2 = 'sales@hhm.com';
        } else {
            contactEmail2 = 'sales1@hhm.com';
        }

        // Create a test Contact 1
        Contact con = new Contact(FirstName = 'Howard', LastName = 'Hamlin', AccountId = acc.Id, Title = 'Senior Partner', LeadSource = 'Web', Phone = '542-558-8977', 
            Email = contactEmail1);
        insert con;

        // Create a test Contact 2
        Contact con2 = new Contact(FirstName = 'Kim', LastName = 'Wexler', AccountId = acc.Id, Title = 'Partner', LeadSource = 'Web', Phone = '542-558-9980', 
            Email = contactEmail2);
        insert con2;
	}
}