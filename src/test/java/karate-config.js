function fn() {

    var env = karate.env;
    var config = {env:env}
    //fixed headers for all the requests:
    var headers = {"Content-Type": "application/json"}

    config.baseUrl = 'https://bookstore.demoqa.com'

    karate.log('the karate tests are running on: ', env);
    //2 tries in half a second each:
    karate.configure('retry', {count: 2, interval: 500});
    karate.configure('headers', headers);

    return config;
}