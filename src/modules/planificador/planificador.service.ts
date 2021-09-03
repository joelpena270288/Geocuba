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
    let result;
  const {stdout, stderr} = await exec('cd /home/ubuntu/Geocuba/src/optic/ && ./optic-clp domain.pddl problem.pddl');
     
    
      if (stderr) {
        console.error(`stderr: ${stderr}`);
        return stderr ;
      }
    
   
    return stdout;
  }
 
 
}
