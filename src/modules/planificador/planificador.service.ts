import { WriteStream, writeFileSync } from 'fs';
import { v4 } from 'node-uuid';

import { exec, spawn } from 'child_process';
import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
@Injectable()
export class PlanificadorService {
  async getPlanPrueba(): Promise<any> {
    let stdout;
    try{
      await exec(
        'cd /home/ubuntu/Geocuba/src/optic/ && ./optic-clp domain.pddl prueba.pddl',
        async function (error, stdout, stderr) {
          if (error) {
            throw new BadRequestException(error);
          }
            return  stdout;
          
        },
      );
    }catch(e){
      throw new BadRequestException(e);
    }
    return stdout;

    }
   
}
