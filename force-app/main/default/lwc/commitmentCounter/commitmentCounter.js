import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getDailyCommitment from '@salesforce/apex/Auara_commitmentCounterCtrl.getDailyCommitment';
import setDailyCommitment from '@salesforce/apex/Auara_commitmentCounterCtrl.setDailyCommitment';
import PermissionsSubscribeToLightningDashboards from '@salesforce/schema/PermissionSet.PermissionsSubscribeToLightningDashboards';

export default class CommitmentCounter extends LightningElement {
  @api commitmentsDate = new Date();
  @api commitmentsVisit = 0;
  @api commitmentsMeeting = 0;
  @api commitmentsBeef = 0;

  connectedCallback() {
    this.fetchCommitments();
  }

  handleVisitsChange(event) {
    this.commitmentsVisit = event.detail;
  }

  handleMeetingsChange(event) {
    this.commitmentsMeeting = event.detail;
  }

  handleBeefsChange(event) {
    this.commitmentsBeef = event.detail;
  }

  handleOnDateChange(event) {
    this.commitmentsDate = event.target.value;
    this.fetchCommitments();
  }

  handleOnSave(event) {
    this.putCommitments();
  }

  fetchCommitments() {
    getDailyCommitment({ selectedDate: this.commitmentsDate })
      .then(result => {
        if (result !== null) {
          this.commitmentsDate = result.auara_CommitmentDate__c;
          this.commitmentsVisit = result.auara_CommitmentForVisits__c;
          this.commitmentsMeeting = result.auara_CommitmentForMeetings__c;
          this.commitmentsBeef = result.auara_CommitmentForBeefs__c;
        } else {
          this.commitmentsVisit = 0;
          this.commitmentsMeeting = 0;
          this.commitmentsBeef = 0;
        }
      })
      .catch(error => {
        this.error = error;
      });
  }

  putCommitments() {
    let commitment = { 'sobjectType': 'auara_DailyCommitment__c' };
    commitment.auara_CommitmentDate__c = this.commitmentsDate;
    commitment.auara_CommitmentForBeefs__c = this.commitmentsBeef;
    commitment.auara_CommitmentForVisits__c = this.commitmentsVisit;
    commitment.auara_CommitmentForMeetings__c = this.commitmentsMeeting;

    setDailyCommitment({ myCommitment: commitment })
      .then(result => {
        if (result !== null) {
          this.dispatchEvent(
            new ShowToastEvent({
              title: 'Daily Commitments',
              message: 'Successfully updated!',
              variant: 'success',
            }),
          );
        }
      })
      .catch(error => {
        this.error = error;
      });
  }
}