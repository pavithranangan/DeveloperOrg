<aura:application extends="force:slds">
	 <!-- c:expenses/ -->	
    <lightning:layout class="slds-page-header slds-page-header--object-home">
        <lightning:layoutItem>
            <lightning:icon iconName="standard:scan_card" alternativeText="My Expenses"/>
        </lightning:layoutItem>
        <lightning:layoutItem padding="horizontal-small">
            <div class="page-section page-header">
                <h1 class="slds-text-heading--label">Expenses</h1>
                <h2 class="slds-text-heading--medium">My Expenses</h2>
            </div>
        </lightning:layoutItem>
    </lightning:layout>
    <!-- / PAGE HEADER -->
    <!-- NEW EXPENSE FORM -->
    <lightning:layout>
        <lightning:layoutItem padding="around-small" size="6">
        <!-- [[ expense form goes here ]] -->
        <form class="slds-form--stacked">          
            <lightning:input aura:id="expenseform" label="Expense Name"
                             name="expensename"
                             value="{!v.newExpense.Name}"
                             required="true"/> 
            <lightning:input type="number" aura:id="expenseform" label="Amount"
                             name="expenseamount"
                             min="0.1"
                             formatter="currency"
                             step="0.01"
                             value="{!v.newExpense.Amount__c}"
                             messageWhenRangeUnderflow="Enter an amount that's at least $0.10."/>
            <lightning:input aura:id="expenseform" label="Client"
                             name="expenseclient"
                             value="{!v.newExpense.Client__c}"
                             placeholder="ABC Co."/>
            <lightning:input type="date" aura:id="expenseform" label="Expense Date"
                             name="expensedate"
                             value="{!v.newExpense.Date__c}"/>
            <lightning:input type="checkbox" aura:id="expenseform" label="Reimbursed?"  
                             name="expreimbursed"
                             checked="{!v.newExpense.Reimbursed__c}"/>
            <lightning:button label="Create Expense" 
                              class="slds-m-top--medium"
                              variant="brand"
                              onclick="{!c.clickCreate}"/>
        </form>
        </lightning:layoutItem>
    </lightning:layout>
    <!-- / NEW EXPENSE FORM -->
</aura:application>