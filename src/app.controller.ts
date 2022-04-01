import { Controller, Get } from '@nestjs/common';
import { Logger } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get('hello')
  getHello(): string {
    return this.appService.getHello();
  }

  @Get()
  getHeath(): string {
    Logger.debug('hello');
    return "HeathCheck";
  }
}
