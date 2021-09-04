import { IsNotEmpty, IsString } from 'class-validator';
export class Peticion {
  @IsNotEmpty()
  @IsString()
  domain: string;
  @IsNotEmpty()
  @IsString()
  problem: string;
}