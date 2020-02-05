import { LightningElement, track } from 'lwc';
import getAddressAutoComplete from '@salesforce/apex/GoogleAddressIntegrationController.getAddressAutoComplete';
import getAddressDetails from '@salesforce/apex/GoogleAddressIntegrationController.getAddressDetails';
export default class GoogleAddressIntegration extends LightningElement {
    @track searchKey = '';
    @track filteredOptions = [];
    @track addressFound = false;
    @track selectedAddress = false;
    @track address = '';

    searchAddress (e) {
        this.searchKey = e.target.value;
        getAddressAutoComplete({input: this.searchKey})
            .then(result => {
                const response = JSON.parse(result);
                let predictions = response.predictions;
                let addressList = [];
                    if (predictions.length > 0) {
                        for (let i = 0; i < predictions.length; i++) {
                            let obj = predictions[i];
                            let bc = [];
                            for (let j = 0; j < obj.terms.length; j++) {
                                bc.push(obj.terms[j].offset, obj.terms[j].value);
                            }
                            addressList.push(
                            {
                                value: obj.types[0],
                                PlaceId: obj.place_id,
                                localVal: bc,
                                label: obj.description
                            });
                        }
                    }
                    if(addressList.length > 0){
                        this.filteredOptions = addressList;
                        this.addressFound = true;
                    }
            })
            .catch(error => {
                console.log('error---->'+JSON.stringify(error));
            });
    }

    selectValue (e) {
        this.address = e.currentTarget.id;
        this.addressFound = false;
        this.selectedAddress = true;
        this.getAddressDetails (e.currentTarget.accessKey);
    }

    removeValue () {
        this.selectedAddress = false;
    }

    getAddressDetails (placeId) {
        getAddressDetails({placeId: placeId})
            .then(result => {
                    let response = JSON.parse(result);
                    if (response.result.address_components && response.result.address_components.length > 0) {
                        let street = '';
                        for (let i = 0; i < response.result.address_components.length; i++) {
                            console.log('response.result.address_components--> '+response.result.address_components[i]);
                            let address = response.result.address_components[i];
                            console.log('address--> '+address.types);
                            for (let j = 0; j < address.types.length; j++) {
                                console.log('address--> '+address.types[j]);
                                let temp = address.types[j];
                                if (temp.toLowerCase() === 'street_number') {
                                    street += temp.long_name;
                                }
                                if (temp.toLowerCase() === 'sublocality') {
                                    street += ' ' + temp.long_name;
                                }
                                if (temp.toLowerCase() === 'route') {
                                    street += ' ' + temp.long_name;
                                }
                                if (temp.toLowerCase() === 'locality') {
                                    street += ' ' + temp.long_name;
                                }
                                if (temp.toLowerCase() === 'administrative_area_level_1') {
                                    street += ' ' + temp.long_name;
                                }
                                if (temp.toLowerCase() === 'country') {
                                    street += ' ' + temp.long_name;
                                }
                                if (temp.toLowerCase() === 'postal_code') {
                                    street += ' ' + temp.long_name;
                                }
                            }
                        }
                        console.log('Street--> '+street);
                    }
            })
            .catch(error => {
                console.log('error---->'+JSON.stringify(error));
            });
    }
                
}