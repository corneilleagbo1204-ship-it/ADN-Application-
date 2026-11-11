import {
  IsBoolean,
  IsEmail,
  IsIn,
  IsOptional,
  IsString,
  MaxLength,
  MinLength,
} from 'class-validator';

export class RegisterUserDto {
  @IsString()
  @MinLength(8)
  @MaxLength(20)
  phoneNumber: string;

  @IsOptional()
  @IsEmail()
  email?: string;

  @IsString()
  @MinLength(2)
  @MaxLength(180)
  displayName: string;

  @IsIn([
    'individual',
    'professional',
    'company',
    'artisan_service',
    'merchant',
    'buyer',
    'association',
    'institution',
  ])
  accountType: string;

  @IsBoolean()
  termsAccepted: boolean;
}
