import express, { Express, Request, Response , Application } from 'express';
import { studentRouter } from './routes/studentRouter';
import { universityRouter } from './routes/university.Router';
import { pharmacyRouter } from './routes/pharmacyRouter';
import { rentalHomeRouter } from './routes/rentalHomeRouter';
import dotenv from 'dotenv';
import bodyParser from 'body-parser';
import { allowedNodeEnvironmentFlags } from 'process';
import { workerData } from 'worker_threads';
import { addScopeOptionsGetter } from 'sequelize-typescript';
import { isAsExpression } from 'typescript';
//For env File 
dotenv.config();

const app: Application = express();
app.use(bodyParser.urlencoded());

app.use(bodyParser.json());

app.use('/student', studentRouter);
app.use('/place/university', universityRouter);
app.use("/place/pharmacy",pharmacyRouter);
app.use("/place/rentalhome",rentalHomeRouter);

const port = process.env.PORT || 8000;
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});