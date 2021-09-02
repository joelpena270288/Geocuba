import { Configuration } from './config/config.key';
import { ConfigModule } from './config/config.module';
import { ConfigService } from './config/config.service';
import { HttpModule, Module } from '@nestjs/common';
import { PlanificadorModule } from './planificador/planificador.module';
@Module({
  imports: [ConfigModule, HttpModule, PlanificadorModule],
  controllers: [],
  providers: [ ],
})
export class AppModule {
  static port: number | string;
  constructor(private readonly _configService: ConfigService) {
    AppModule.port = this._configService.get(Configuration.PORT);
  }
}
