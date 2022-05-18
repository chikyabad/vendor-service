using { cac.training.procurement as schema } from '../db/schema';

@path: '/vendors-service'
service VendorService {
  @readonly entity Vendors as projection on schema.Vendors;
  @readonly entity Products as projection on schema.Products;
}

@path: '/vendors-service-admin'
@requires: 'system-user'
service VendorServiceAdmin {
  entity Vendors as projection on schema.Vendors;
  entity Products as projection on schema.Products;
}

