
#include "UnitTest++.h"
#include "muparser/muParser.h"
#include <vector>
#include <iostream>

#define PARSER_CONST_PI  3.141592653589793238462643
#define PARSER_CONST_E   2.718281828459045235360287
#define PARSER_MAXVARS		10

std::vector<double> afValBuf;

double* AddVariable(const char *a_szName, void *pUserData)
{
   afValBuf.push_back(0.);

  return &afValBuf[afValBuf.size()-1];
}

namespace
{

TEST(FirstTest)
{
   using namespace mu;
   Parser parser;

   double Re = 67686.438256724403;
   double Pr = 0.67266730930581042;
   parser.SetExpr("0.027 * (Re^0.8) * (Pr^0.33)");
   parser.DefineVar("Re",&Re);
   parser.DefineVar("Pr",&Pr);

   double fval = parser.Eval();
   CHECK_CLOSE(fval, 0.027*pow(Re,0.8)*pow(Pr,0.33), 0.0001); // succeeds
}

} // end of anonymous namespace
    