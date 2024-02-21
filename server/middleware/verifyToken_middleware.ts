import { Request, Response, NextFunction } from "express";
import jwt from "jsonwebtoken";
import { JwtClass } from "../utilities/JwtClass.js";

export function verifyAccessToken(req: Request, res: Response, next: NextFunction) {
  const authHeader: string | undefined = req.headers["authorization"];
  if (!authHeader) {
    let error = {
      success: false,
      error: "forbiden access, no token",
    };
    res.statusCode = 401;
    res.json(error);
    return;
  }
  
  const token = authHeader?.split(" ")[1];
  jwt.verify(token, String(process.env.ACCESS_TOKEN_SECRET), (err: any, decoded: any) => {
    if (err) {
      let error = {
        success: false,
        error: "invalid token",
      };
      res.statusCode = 403;
      res.json(error);
    } else {
      req.headers['user'] = decoded.id;
      next();
    }
  });
}
