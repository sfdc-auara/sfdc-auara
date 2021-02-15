import { LightningElement, api } from 'lwc';

export default class Counter extends LightningElement {
    @api counterValue = 0;
    @api incrementValue = 1;
    @api label = 'Counter'

    handleDecrement(event) {
        this.counterValue = parseInt(this.counterValue) - parseInt(this.incrementValue);
        this.dispatchEvent(new CustomEvent('counterchange', { detail : this.counterValue }));
    }

    handleIncrement(event) {
        this.counterValue = parseInt(this.counterValue) + parseInt(this.incrementValue);
        this.dispatchEvent(new CustomEvent('counterchange', { detail : this.counterValue }));
    }
}