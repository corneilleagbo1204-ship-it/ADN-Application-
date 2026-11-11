import { Injectable } from '@nestjs/common';

@Injectable()
export class UsersService {
  getAccountTypes() {
    return [
      { code: 'individual', label: 'Particulier' },
      { code: 'professional', label: 'Professionnel et indépendant' },
      { code: 'company', label: 'Petite, moyenne et grande entreprise' },
      { code: 'artisan_service', label: 'Artisan et prestataire de services' },
      { code: 'merchant', label: 'Commerçant et vendeur particulier' },
      { code: 'buyer', label: 'Acheteur professionnel ou particulier' },
      { code: 'association', label: 'Association et organisation' },
      { code: 'institution', label: 'Administration et institution' },
    ];
  }
}
