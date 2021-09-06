import { WriteStream, writeFileSync } from 'fs';
import { htmlToText } from 'html-to-text';
import { v4 } from 'node-uuid';

import { exec, spawn } from 'child_process';
import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
@Injectable()
export class PlanificadorService {
  async getPlanPrueba(
    nombredominio: string,
    nombreproblema: string,
  ): Promise<any> {
    const cmd =
      'cd /home/ubuntu/Geocuba/src/optic/ && ./optic-clp' +
      ' ' +
      nombredominio +
      '.pddl' +
      ' ' +
      nombreproblema +
      '.pddl';
    const result = await this.execShellCommand(cmd);
    const borrar =
      'cd /home/ubuntu/Geocuba/src/optic/ && rm  ' +
      ' ' +
      nombredominio +
      '.pddl' +
      ' ' +
      nombreproblema +
      '.pddl';
    this.borrarDatos(borrar);
    return result;
  }
  async createPlan(domain: string, problem: string): Promise<any> {
    const dominio = htmlToText(domain);
    const problema = htmlToText(problem);
    const nombredominio = v4();
    const nombreproblema = v4();
    const dirdomain: string =
      '/home/ubuntu/Geocuba/src/optic/' + nombredominio + '.pddl';
    const dirproblem: string =
      '/home/ubuntu/Geocuba/src/optic/' + nombreproblema + '.pddl';
    await writeFileSync(dirdomain, dominio, { mode: 0o755 });
    await writeFileSync(dirproblem, problema, { mode: 0o755 });
    const cmd =
      'cd /home/ubuntu/Geocuba/src/optic/ && ./optic-clp' +
      ' ' +
      nombredominio +
      '.pddl' +
      ' ' +
      nombreproblema +
      '.pddl';
    return await this.execShellCommand(cmd);
  }

  execShellCommand(cmd) {
    return new Promise((resolve, reject) => {
      exec(cmd, (error, stdout, stderr) => {
        if (error) {
          throw new BadRequestException(error);
        }
        const salidacompleta: string[] = stdout.split('Cost:');
        const salidaoptima: string[] = salidacompleta[1].split(':');
        const salida: string[] = salidacompleta[1].split('\n');
        resolve(salida ? salida : stderr);
      });
    });
  }
  borrarDatos(cmd) {
    exec(cmd, async function (error: any, stdout: string, stderr: any) {
      if (error) {
        console.log('ERROR!!!!!!', error);
      }
    });
  }
}
