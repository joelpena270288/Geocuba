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

    const { stdout, stderr } = await exec('cd /home/ubuntu/Geocuba/src/optic/ && ./optic-clp domain,pddl prueba.pddl');
  
    if (stderr) {
      console.error(`error: ${stderr}`);
    }
    return stdout;
  }
 
}
