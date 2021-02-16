import { LightningElement, api, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getRating from '@salesforce/apex/Auara_RatingEventCtrl.getRating';
import setRating from '@salesforce/apex/Auara_RatingEventCtrl.setRating';
import { getRecord, getRecordNotifyChange } from 'lightning/uiRecordApi';

export default class StarRatings4Events extends LightningElement {
  @api rating = 0;
  @api recordId;
  ratingfetched = true;
  @wire(getRecord, { recordId: '$recordId', fields: ['auara_InteresComplicidad__c'] }) record;

  connectedCallback() {
    this.fetchRating();
  }

  onStarRatingClick(event) {
    if (this.ratingfetched == false) {
      if (this.rating != event.detail.rating) {
        this.rating = event.detail.rating;
        this.putRating();
      }
    }
  }

  fetchRating() {
    getRating({ recordId: this.recordId })
      .then(result => {
        if (result !== null) {
          this.rating = result.auara_InteresComplicidad__c;
        } else {
          this.rating = 0;
        }
        this.ratingfetched = false;
      })
      .catch(error => {
        console.log(error);
      });
  }

  putRating() {
    setRating({ recordId: this.recordId, rating: this.rating })
      .then(result => {
        if (result !== null) {
          getRecordNotifyChange([{recordId: this.recordId}]);
          this.dispatchEvent(
            new ShowToastEvent({
              title: 'Event',
              message: 'Successfully rated!',
              variant: 'success',
            }),
          );
        }
      })
      .catch(error => {
        console.log(error);
      });
  }
}