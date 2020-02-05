public class GoogleAddressIntegrationController {
    @AuraEnabled
    public static string getAddressAutoComplete(String input) {
        //String types = '(regions)';
        String language = 'en';
        String url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=' + EncodingUtil.urlEncode(input, 'UTF-8') +
            /*'&types=' + types*/ +'&language=' + language + '&key=' + GoogleAddressIntegrationController.getGoogleMapsAPIKey() + '&libraries=places';
        return GoogleAddressIntegrationController.getHttp(url);
    }

    private static String getGoogleMapsAPIKey() {
        /* return 'AIzaSyDb5QzlDjdgmjsZfXqSQI-KYcPWmMiifHg';*/
        return 'AIzaSyAmtOMoxUFLr5NY4zYlqnVNRF8OlFLOKEE'; //Added Date 11 march 2019
    }

    private static String getHttp(String url) {
        try {
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint(url);
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            System.debug('response body-->'+response.getBody());
            return response.getBody();
        } catch (Exception e) {
            return 'ERROR: ' + e.getMessage();
        }
    }

    @AuraEnabled
    public static string getAddressDetails(String placeId) {
        String url = 'https://maps.googleapis.com/maps/api/place/details/json?placeid=' + placeId + '&language=en&key=' + GoogleAddressIntegrationController.getGoogleMapsAPIKey();
        return GoogleAddressIntegrationController.getHttp(url);
    }
}