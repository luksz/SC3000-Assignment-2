% Facts
competitor(sumsum, appy).
developed(sumsum, galactica_s3).
smart_phone_tech(galactica_s3).
stolen(stevey, galactica_s3).
boss_of(stevey, appy).

% Rules to determine unethical behavior
unethical(X) :- boss_of(X, Company), competitor(Competitor, Company), developed(Competitor, Technology), stolen(X, Technology), smart_phone_tech(Technology).

%Rules for business
rival(X, Y) :- competitor(X, Y).
business(X) :- smart_phone_tech(X).






