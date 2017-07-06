function countHolidays(t, e) {
  for (var a = new DateUtil(t), r = new DateUtil(e), i = a.getDiffDay(r.getDateWithoutFormat()), s = 0, m = 0; i > m; m++) new DateUtil(a.calcDay(m)).isHoliday() && ++s;
  return s
}
var DateUtil = function (t, e) {
  var a = 1000,
  r = 60 * a,
  i = 60 * r;
  if (this.ONE_DAY = 24 * i, this.DEFAULT_FORMAT = function () {
    return 'yyyy.mm.dd'
  }, this.DEFAULT_DELIM = function () {
    return '.'
  }, this.myFormat = this.DEFAULT_FORMAT(), this.myDate = new Date, e) {
    if (4 != this.getFormatChar('y', e).length && 2 != this.getFormatChar('y', e).length) return this;
    if (2 != this.getFormatChar('m', e).length) return this;
    if (2 != this.getFormatChar('d', e).length) return this;
    this.setFormat(e);
    var s = t.substring(this.indexOf('y'), this.lastIndexOf('y') + 1),
    m = t.substring(this.indexOf('m'), this.lastIndexOf('m') + 1),
    n = t.substring(this.indexOf('d'), this.lastIndexOf('d') + 1);
    s = 2 == s.length ? s + 2000 : s,
    this.myDate = new Date(s, m - 1, n)
  } else if (this.checkDate(t)) {
    t = this.removeDelimiters(t);
    var s = t.substr(0, 4),
    m = t.substr(4, 2),
    n = 8 == t.length ? t.substr(6)  : 1;
    this.myDate = new Date(s, m - 1, n)
  }
};
DateUtil.prototype = {
  setYear: function (t) {
    return this.myDate.setYear(t),
    this
  },
  setMonth: function (t) {
    return this.myDate.setMonth(t - 1),
    this
  },
  setDay: function (t) {
    return this.myDate.setDate(t),
    this
  },
  setDate: function (t) {
    if (!t) return this;
    if (t instanceof Date) this.myDate = t;
     else {
      var e = String(t),
      a = e.substr(0, 4),
      r = e.substr(4, 2),
      i = e.substr(6, 2);
      if (!this.checkDate('' + a + r + i)) return this;
      this.myDate = new Date(a, r - 1, i)
    }
    return this
  },
  setDateWithFormat: function (t, e) {
    if (!t) return this;
    var a = e || this.myFormat;
    if (t instanceof Date) this.myDate = t;
     else {
      var r = String(t),
      i = r.substring(a.indexOf('y'), a.lastIndexOf('y') + 1),
      s = r.substring(a.indexOf('m'), a.lastIndexOf('m') + 1),
      m = r.substring(a.indexOf('d'), a.lastIndexOf('d') + 1);
      if (!this.checkDate('' + i + s + m)) return this;
      this.myDate = new Date(i, s - 1, m)
    }
    return this
  },
  setFormat: function (t) {
    return 'string' == typeof t ? (t = t.toLowerCase(), 4 == this.getFormatChar('y', t).length && 2 == this.getFormatChar('m', t).length && 2 == this.getFormatChar('d', t).length && (this.myFormat = t.toLowerCase()), this)  : void 0
  },
  getFormat: function () {
    return this.myFormat
  },
  getYearFormat: function () {
    return this.getFormatChar('y')
  },
  getMonthFormat: function () {
    return this.getFormatChar('m')
  },
  getDayFormat: function () {
    return this.getFormatChar('d')
  },
  getDate: function (format) {
    var aDate = this.myDate,
    fmtDate = format ? format : this.myFormat,
    yf = this.getFormatChar('y', fmtDate),
    mf = this.getFormatChar('m', fmtDate),
    df = this.getFormatChar('d', fmtDate);
    return fmtDate = fmtDate.replace(eval('/' + yf + '/i'), 2 == yf.length ? this.format(aDate.getFullYear() < 2000 ? aDate.getYear()  : aDate.getFullYear() - 2000)  : aDate.getFullYear()),
    fmtDate = fmtDate.replace(eval('/' + mf + '/i'), this.format(aDate.getMonth() + 1)),
    fmtDate = fmtDate.replace(eval('/' + df + '/i'), this.format(aDate.getDate()))
  },
  getDateWithDelimiter: function (t) {
    var e = this.myDate,
    a = /([^ymd])/gi,
    r = a.exec(this.myFormat),
    i = this.myFormat,
    s = null != t ? t : r ? r[0] : t,
    m = null != t ? t : r && r.length > 1 ? r[1] : t,
    n = this.getFormatChar('y', i),
    f = (this.getFormatChar('m', i), this.getFormatChar('d', i), (2 == n.length ? this.format(e.getFullYear() < 2000 ? e.getYear()  : e.getFullYear() - 2000)  : e.getFullYear()) + s + this.format(e.getMonth() + 1) + m + this.format(e.getDate()));
    return f
  },
  getDateWithoutFormat: function () {
    return this.removeDelimiters(this.getDate(this.myFormat))
  },
  getToday: function (t) {
    var e = new Date;
    return t = null == t ? this.DEFAULT_DELIM()  : t,
    e.getFullYear() + t + this.format(e.getMonth() + 1) + t + this.format(e.getDate())
  },
  getMmdd: function (format) {
    var aDate = this.myDate,
    fmtDate = format ? format : this.myFormat,
    yf = this.getFormatChar('y', fmtDate),
    mf = this.getFormatChar('m', fmtDate),
    md = fmtDate.lastIndexOf('m') + 1;
    return fmtDate = fmtDate.replace(eval('/' + yf + '/i'), 2 == yf.length ? this.format(aDate.getFullYear() < 2000 ? aDate.getYear()  : aDate.getFullYear() - 2000)  : aDate.getFullYear()),
    fmtDate = fmtDate.replace(eval('/' + mf + '/i'), this.format(aDate.getMonth() + 1)),
    fmtDate.substring(0, md)
  },
  calcDay: function (dateDiff, format) {
    var aDate = new Date(this.myDate.getTime() + this.ONE_DAY * dateDiff),
    fmtDate = format ? format : this.myFormat,
    yf = this.getFormatChar('y', fmtDate),
    mf = this.getFormatChar('m', fmtDate),
    df = this.getFormatChar('d', fmtDate);
    return fmtDate = fmtDate.replace(eval('/' + yf + '/i'), 2 == yf.length ? this.format(aDate.getFullYear() < 2000 ? aDate.getYear()  : aDate.getFullYear() - 2000)  : aDate.getFullYear()),
    fmtDate = fmtDate.replace(eval('/' + mf + '/i'), this.format(aDate.getMonth() + 1)),
    fmtDate = fmtDate.replace(eval('/' + df + '/i'), this.format(aDate.getDate()))
  },
  calcMonth: function (monthDiff, format) {
    if (isNaN(monthDiff)) return this.getDate(format);
    for (var year = this.myDate.getFullYear(), month = this.myDate.getMonth() + 1, day = this.myDate.getDate(), cYear = year, cMonth = Number(month) + Number(monthDiff); cMonth > 12; ) cYear++,
    cMonth -= 12;
    for (; 1 > cMonth; ) cYear--,
    cMonth += 12;
    var lastDay = this.getLastDay(cYear + this.format(cMonth));
    day > lastDay && (day = lastDay);
    var aDate = new Date(cYear, cMonth - 1, day),
    fmtDate = format ? format : this.myFormat,
    yf = this.getFormatChar('y', fmtDate),
    mf = this.getFormatChar('m', fmtDate),
    df = this.getFormatChar('d', fmtDate);
    return fmtDate = fmtDate.replace(eval('/' + yf + '/i'), 2 == yf.length ? this.format(aDate.getFullYear() < 2000 ? aDate.getYear()  : aDate.getFullYear() - 2000)  : aDate.getFullYear()),
    fmtDate = fmtDate.replace(eval('/' + mf + '/i'), this.format(aDate.getMonth() + 1)),
    fmtDate = fmtDate.replace(eval('/' + df + '/i'), this.format(aDate.getDate()))
  },
  getDiffDay: function (t) {
    if (this.checkDate(t)) {
      var e = this.removeDelimiters(t),
      a = new Date(e.substr(0, 4), e.substr(4, 2) - 1, e.substr(6, 2));
      return new Date(a.getTime() - this.myDate.getTime()) / this.ONE_DAY
    }
  },
  getLastDay: function (t) {
    var e = this.getDateObject(t),
    a = e.getFullYear(),
    r = e.getMonth() + 1,
    i = 0;
    switch (Number(r)) {
      case 4:
      case 6:
      case 9:
      case 11:
        i = '30';
        break;
      case 2:
        i = a % 4 == 0 && a % 100 != 0 || a % 400 == 0 ? '29' : '28';
        break;
      default:
        i = '31'
    }
    return '' + i
  },
  getLastDayYMD: function (objDate, format) {
    var aDate = this.getDateObject(objDate),
    fmtDate = format ? format : this.myFormat,
    yf = this.getFormatChar('y', fmtDate),
    mf = this.getFormatChar('m', fmtDate),
    df = this.getFormatChar('d', fmtDate);
    return fmtDate = fmtDate.replace(eval('/' + yf + '/i'), 2 == yf.length ? this.format(aDate.getFullYear() < 2000 ? aDate.getYear()  : aDate.getFullYear() - 2000)  : aDate.getFullYear()),
    fmtDate = fmtDate.replace(eval('/' + mf + '/i'), this.format(aDate.getMonth() + 1)),
    fmtDate = fmtDate.replace(eval('/' + df + '/i'), this.getLastDay(aDate))
  },
  getFormatChar: function (t, e) {
    var a = (e ? e : this.myFormat).toLowerCase(),
    r = a.indexOf(t.toLowerCase()),
    i = a.lastIndexOf(t.toLowerCase());
    return a.substring(r, i + 1)
  },
  checkDate: function (t) {
    var e = 0,
    a = 0,
    r = 0,
    i = 0;
    if (!t) return !1;
    if (ymdDate = this.removeDelimiters(t), isNaN(ymdDate)) return !1;
    if (6 == ymdDate.length) {
      if (a = parseInt(ymdDate.substring(4, 6), 10), 1 > a || a > 12) return !1
    } else {
      if (8 != ymdDate.length) return !1;
      if (e = parseInt(ymdDate.substring(0, 4), 10), a = parseInt(ymdDate.substring(4, 6), 10), r = parseInt(ymdDate.substring(6, 8), 10), 1 > a || a > 12) return !1;
      if (1 > r) return !1;
      switch (a) {
        case 4:
        case 6:
        case 9:
        case 11:
          i = '30';
          break;
        case 2:
          i = e % 4 == 0 && e % 100 != 0 || e % 400 == 0 ? '29' : '28';
          break;
        default:
          i = '31'
      }
      if (r > i) return !1
    }
    return !0
  },
  getDateObject: function (t) {
    if (!t) return this.myDate;
    if (t instanceof Date) return t;
    var e = this.removeDelimiters(t);
    return this.checkDate(e) ? 8 == e.length ? new Date(e.substr(0, 4), e.substr(4, 2) - 1, e.substr(6, 2))  : new Date(e.substr(0, 4), e.substr(4, 2) - 1, 1)  : this.myDate
  },
  getDayOfWeek: function (t) {
    var e = this.getDateObject(t),
    a = '';
    switch (e.getDay()) {
      case 0:
        a = '일';
        break;
      case 1:
        a = '월';
        break;
      case 2:
        a = '화';
        break;
      case 3:
        a = '수';
        break;
      case 4:
        a = '목';
        break;
      case 5:
        a = '금';
        break;
      case 6:
        a = '토'
    }
    return a
  },
  getAgoTime: function (t) {
    var e = 1000,
    a = 60 * e,
    r = 60 * a,
    i = 24 * r,
    s = 12 * i,
    m = new Date(t.substr(0, 4), t.substr(4, 2) - 1, t.substr(6, 2), t.substr(8, 2), t.substr(10, 2)),
    n = (new Date).getTime() - m.getTime();
    return Math.floor(n / s) > 0 ? Math.floor(n / s) + '개월전' : Math.floor(n / i) > 0 ? Math.floor(n / i) + '일전' : Math.floor(n / r) > 0 ? Math.floor(n / r) + '시간전' : Math.floor(n / a) > 0 ? Math.floor(n / a) + '분전' : '방금전'
  },
  getDay: function () {
    return this.myDate.getDay()
  },
  isHoliday: function () {
    var t = this.myDate.getDay();
    return !(t > 0 && 6 > t)
  },
  format: function (t) {
    return String(t).length < 2 ? '0' + t : t
  },
  indexOf: function (t) {
    return this.myFormat.indexOf(t)
  },
  lastIndexOf: function (t) {
    return this.myFormat.lastIndexOf(t)
  },
  removeDelimiters: function (t) {
    return String(t).replace(/[^0-9]/g, '')
  }
};
