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
    const cmd = 'cd /home/ubuntu/Geocuba/src/optic/ && ./optic-clp domain.pddl problem.pddl';
    return await this.execShellCommand(cmd);
  }

  execShellCommand(cmd) {
    return new Promise((resolve, reject) => {
      exec(cmd, (error, stdout, stderr) => {
        if (error) {
          throw new BadRequestException(error);
         
        }
        resolve(stdout ? stdout : stderr);
        let salidacompleta: String[] = stdout.split("Cost:");
        let  salidaoptima: String[] = salidacompleta[1].split(":");
        let salida: String[] = salidacompleta[1].split("\n"); 
        return salida;
      });
    });
  }
}
