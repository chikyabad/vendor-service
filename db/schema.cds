namespace cac.training.procurement;

using {managed} from '@sap/cds/common';

@assert.unique : {
    name    : [name],
    address : [
        country,
        postalCode
    ]
}
entity Vendors {
    key id         : Integer;
        name       : String(200);
        country    : String(3)
            @assert.range enum {
                UK;
                ES;
                DE;
                FR;
            };
        postalCode : String(20);
        currency   : String(3);
        products   : Composition of many Products
                         on products.vendor = $self;

}

@assert.unique : {name : [name]}
entity Products {
    key id        : Integer;
        name      : String;
        unitPrice : Decimal;
        vendor    : Association to Vendors;
}
