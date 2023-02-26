; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_12-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_12-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_12_bad() #0 !dbg !14 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  %i23 = alloca i32, align 4
  %buffer24 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 -1, i32* %data, align 4, !dbg !21
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !22
  %tobool = icmp ne i32 %call, 0, !dbg !22
  br i1 %tobool, label %if.then, label %if.else, !dbg !24

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !25
  br label %if.end, !dbg !27

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !28
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !30
  %tobool2 = icmp ne i32 %call1, 0, !dbg !30
  br i1 %tobool2, label %if.then3, label %if.else22, !dbg !32

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !33, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !37, metadata !DIExpression()), !dbg !38
  %call4 = call i8* @malloc(i64 noundef 40) #5, !dbg !39
  %0 = bitcast i8* %call4 to i32*, !dbg !40
  store i32* %0, i32** %buffer, align 8, !dbg !38
  %1 = load i32*, i32** %buffer, align 8, !dbg !41
  %cmp = icmp eq i32* %1, null, !dbg !43
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !44

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 noundef -1) #6, !dbg !45
  unreachable, !dbg !45

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !50
  %cmp7 = icmp slt i32 %2, 10, !dbg !52
  br i1 %cmp7, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !54
  %4 = load i32, i32* %i, align 4, !dbg !56
  %idxprom = sext i32 %4 to i64, !dbg !54
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !54
  store i32 0, i32* %arrayidx, align 4, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !59
  %inc = add nsw i32 %5, 1, !dbg !59
  store i32 %inc, i32* %i, align 4, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !64
  %cmp8 = icmp sge i32 %6, 0, !dbg !66
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !67

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !68
  %8 = load i32, i32* %data, align 4, !dbg !70
  %idxprom10 = sext i32 %8 to i64, !dbg !68
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !68
  store i32 1, i32* %arrayidx11, align 4, !dbg !71
  store i32 0, i32* %i, align 4, !dbg !72
  br label %for.cond12, !dbg !74

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !75
  %cmp13 = icmp slt i32 %9, 10, !dbg !77
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !78

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !79
  %11 = load i32, i32* %i, align 4, !dbg !81
  %idxprom15 = sext i32 %11 to i64, !dbg !79
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !79
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !79
  call void @printIntLine(i32 noundef %12), !dbg !82
  br label %for.inc17, !dbg !83

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !84
  %inc18 = add nsw i32 %13, 1, !dbg !84
  store i32 %inc18, i32* %i, align 4, !dbg !84
  br label %for.cond12, !dbg !85, !llvm.loop !86

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !88

if.else20:                                        ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !89
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !91
  %15 = bitcast i32* %14 to i8*, !dbg !91
  call void @free(i8* noundef %15), !dbg !92
  br label %if.end52, !dbg !93

if.else22:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i23, metadata !94, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata i32** %buffer24, metadata !98, metadata !DIExpression()), !dbg !99
  %call25 = call i8* @malloc(i64 noundef 40) #5, !dbg !100
  %16 = bitcast i8* %call25 to i32*, !dbg !101
  store i32* %16, i32** %buffer24, align 8, !dbg !99
  %17 = load i32*, i32** %buffer24, align 8, !dbg !102
  %cmp26 = icmp eq i32* %17, null, !dbg !104
  br i1 %cmp26, label %if.then27, label %if.end28, !dbg !105

if.then27:                                        ; preds = %if.else22
  call void @exit(i32 noundef -1) #6, !dbg !106
  unreachable, !dbg !106

if.end28:                                         ; preds = %if.else22
  store i32 0, i32* %i23, align 4, !dbg !108
  br label %for.cond29, !dbg !110

for.cond29:                                       ; preds = %for.inc34, %if.end28
  %18 = load i32, i32* %i23, align 4, !dbg !111
  %cmp30 = icmp slt i32 %18, 10, !dbg !113
  br i1 %cmp30, label %for.body31, label %for.end36, !dbg !114

for.body31:                                       ; preds = %for.cond29
  %19 = load i32*, i32** %buffer24, align 8, !dbg !115
  %20 = load i32, i32* %i23, align 4, !dbg !117
  %idxprom32 = sext i32 %20 to i64, !dbg !115
  %arrayidx33 = getelementptr inbounds i32, i32* %19, i64 %idxprom32, !dbg !115
  store i32 0, i32* %arrayidx33, align 4, !dbg !118
  br label %for.inc34, !dbg !119

for.inc34:                                        ; preds = %for.body31
  %21 = load i32, i32* %i23, align 4, !dbg !120
  %inc35 = add nsw i32 %21, 1, !dbg !120
  store i32 %inc35, i32* %i23, align 4, !dbg !120
  br label %for.cond29, !dbg !121, !llvm.loop !122

for.end36:                                        ; preds = %for.cond29
  %22 = load i32, i32* %data, align 4, !dbg !124
  %cmp37 = icmp sge i32 %22, 0, !dbg !126
  br i1 %cmp37, label %land.lhs.true, label %if.else50, !dbg !127

land.lhs.true:                                    ; preds = %for.end36
  %23 = load i32, i32* %data, align 4, !dbg !128
  %cmp38 = icmp slt i32 %23, 10, !dbg !129
  br i1 %cmp38, label %if.then39, label %if.else50, !dbg !130

if.then39:                                        ; preds = %land.lhs.true
  %24 = load i32*, i32** %buffer24, align 8, !dbg !131
  %25 = load i32, i32* %data, align 4, !dbg !133
  %idxprom40 = sext i32 %25 to i64, !dbg !131
  %arrayidx41 = getelementptr inbounds i32, i32* %24, i64 %idxprom40, !dbg !131
  store i32 1, i32* %arrayidx41, align 4, !dbg !134
  store i32 0, i32* %i23, align 4, !dbg !135
  br label %for.cond42, !dbg !137

for.cond42:                                       ; preds = %for.inc47, %if.then39
  %26 = load i32, i32* %i23, align 4, !dbg !138
  %cmp43 = icmp slt i32 %26, 10, !dbg !140
  br i1 %cmp43, label %for.body44, label %for.end49, !dbg !141

for.body44:                                       ; preds = %for.cond42
  %27 = load i32*, i32** %buffer24, align 8, !dbg !142
  %28 = load i32, i32* %i23, align 4, !dbg !144
  %idxprom45 = sext i32 %28 to i64, !dbg !142
  %arrayidx46 = getelementptr inbounds i32, i32* %27, i64 %idxprom45, !dbg !142
  %29 = load i32, i32* %arrayidx46, align 4, !dbg !142
  call void @printIntLine(i32 noundef %29), !dbg !145
  br label %for.inc47, !dbg !146

for.inc47:                                        ; preds = %for.body44
  %30 = load i32, i32* %i23, align 4, !dbg !147
  %inc48 = add nsw i32 %30, 1, !dbg !147
  store i32 %inc48, i32* %i23, align 4, !dbg !147
  br label %for.cond42, !dbg !148, !llvm.loop !149

for.end49:                                        ; preds = %for.cond42
  br label %if.end51, !dbg !151

if.else50:                                        ; preds = %land.lhs.true, %for.end36
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !152
  br label %if.end51

if.end51:                                         ; preds = %if.else50, %for.end49
  %31 = load i32*, i32** %buffer24, align 8, !dbg !154
  %32 = bitcast i32* %31 to i8*, !dbg !154
  call void @free(i8* noundef %32), !dbg !155
  br label %if.end52

if.end52:                                         ; preds = %if.end51, %if.end21
  ret void, !dbg !156
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn
declare void @exit(i32 noundef) #4

declare void @printIntLine(i32 noundef) #2

declare void @printLine(i8* noundef) #2

declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_12_good() #0 !dbg !157 {
entry:
  call void @goodB2G(), !dbg !158
  call void @goodG2B(), !dbg !159
  ret void, !dbg !160
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !161 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !167, metadata !DIExpression()), !dbg !168
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !169, metadata !DIExpression()), !dbg !170
  %call = call i64 @time(i64* noundef null), !dbg !171
  %conv = trunc i64 %call to i32, !dbg !172
  call void @srand(i32 noundef %conv), !dbg !173
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !174
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_12_good(), !dbg !175
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !176
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !177
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_12_bad(), !dbg !178
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !179
  ret i32 0, !dbg !180
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !181 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  %i24 = alloca i32, align 4
  %buffer25 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !182, metadata !DIExpression()), !dbg !183
  store i32 -1, i32* %data, align 4, !dbg !184
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !185
  %tobool = icmp ne i32 %call, 0, !dbg !185
  br i1 %tobool, label %if.then, label %if.else, !dbg !187

if.then:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !188
  br label %if.end, !dbg !190

if.else:                                          ; preds = %entry
  store i32 10, i32* %data, align 4, !dbg !191
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !193
  %tobool2 = icmp ne i32 %call1, 0, !dbg !193
  br i1 %tobool2, label %if.then3, label %if.else23, !dbg !195

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !196, metadata !DIExpression()), !dbg !199
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !200, metadata !DIExpression()), !dbg !201
  %call4 = call i8* @malloc(i64 noundef 40) #5, !dbg !202
  %0 = bitcast i8* %call4 to i32*, !dbg !203
  store i32* %0, i32** %buffer, align 8, !dbg !201
  %1 = load i32*, i32** %buffer, align 8, !dbg !204
  %cmp = icmp eq i32* %1, null, !dbg !206
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !207

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 noundef -1) #6, !dbg !208
  unreachable, !dbg !208

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !210
  br label %for.cond, !dbg !212

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !213
  %cmp7 = icmp slt i32 %2, 10, !dbg !215
  br i1 %cmp7, label %for.body, label %for.end, !dbg !216

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !217
  %4 = load i32, i32* %i, align 4, !dbg !219
  %idxprom = sext i32 %4 to i64, !dbg !217
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !217
  store i32 0, i32* %arrayidx, align 4, !dbg !220
  br label %for.inc, !dbg !221

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !222
  %inc = add nsw i32 %5, 1, !dbg !222
  store i32 %inc, i32* %i, align 4, !dbg !222
  br label %for.cond, !dbg !223, !llvm.loop !224

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !226
  %cmp8 = icmp sge i32 %6, 0, !dbg !228
  br i1 %cmp8, label %land.lhs.true, label %if.else21, !dbg !229

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data, align 4, !dbg !230
  %cmp9 = icmp slt i32 %7, 10, !dbg !231
  br i1 %cmp9, label %if.then10, label %if.else21, !dbg !232

if.then10:                                        ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !233
  %9 = load i32, i32* %data, align 4, !dbg !235
  %idxprom11 = sext i32 %9 to i64, !dbg !233
  %arrayidx12 = getelementptr inbounds i32, i32* %8, i64 %idxprom11, !dbg !233
  store i32 1, i32* %arrayidx12, align 4, !dbg !236
  store i32 0, i32* %i, align 4, !dbg !237
  br label %for.cond13, !dbg !239

for.cond13:                                       ; preds = %for.inc18, %if.then10
  %10 = load i32, i32* %i, align 4, !dbg !240
  %cmp14 = icmp slt i32 %10, 10, !dbg !242
  br i1 %cmp14, label %for.body15, label %for.end20, !dbg !243

for.body15:                                       ; preds = %for.cond13
  %11 = load i32*, i32** %buffer, align 8, !dbg !244
  %12 = load i32, i32* %i, align 4, !dbg !246
  %idxprom16 = sext i32 %12 to i64, !dbg !244
  %arrayidx17 = getelementptr inbounds i32, i32* %11, i64 %idxprom16, !dbg !244
  %13 = load i32, i32* %arrayidx17, align 4, !dbg !244
  call void @printIntLine(i32 noundef %13), !dbg !247
  br label %for.inc18, !dbg !248

for.inc18:                                        ; preds = %for.body15
  %14 = load i32, i32* %i, align 4, !dbg !249
  %inc19 = add nsw i32 %14, 1, !dbg !249
  store i32 %inc19, i32* %i, align 4, !dbg !249
  br label %for.cond13, !dbg !250, !llvm.loop !251

for.end20:                                        ; preds = %for.cond13
  br label %if.end22, !dbg !253

if.else21:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !254
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %for.end20
  %15 = load i32*, i32** %buffer, align 8, !dbg !256
  %16 = bitcast i32* %15 to i8*, !dbg !256
  call void @free(i8* noundef %16), !dbg !257
  br label %if.end54, !dbg !258

if.else23:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i24, metadata !259, metadata !DIExpression()), !dbg !262
  call void @llvm.dbg.declare(metadata i32** %buffer25, metadata !263, metadata !DIExpression()), !dbg !264
  %call26 = call i8* @malloc(i64 noundef 40) #5, !dbg !265
  %17 = bitcast i8* %call26 to i32*, !dbg !266
  store i32* %17, i32** %buffer25, align 8, !dbg !264
  %18 = load i32*, i32** %buffer25, align 8, !dbg !267
  %cmp27 = icmp eq i32* %18, null, !dbg !269
  br i1 %cmp27, label %if.then28, label %if.end29, !dbg !270

if.then28:                                        ; preds = %if.else23
  call void @exit(i32 noundef -1) #6, !dbg !271
  unreachable, !dbg !271

if.end29:                                         ; preds = %if.else23
  store i32 0, i32* %i24, align 4, !dbg !273
  br label %for.cond30, !dbg !275

for.cond30:                                       ; preds = %for.inc35, %if.end29
  %19 = load i32, i32* %i24, align 4, !dbg !276
  %cmp31 = icmp slt i32 %19, 10, !dbg !278
  br i1 %cmp31, label %for.body32, label %for.end37, !dbg !279

for.body32:                                       ; preds = %for.cond30
  %20 = load i32*, i32** %buffer25, align 8, !dbg !280
  %21 = load i32, i32* %i24, align 4, !dbg !282
  %idxprom33 = sext i32 %21 to i64, !dbg !280
  %arrayidx34 = getelementptr inbounds i32, i32* %20, i64 %idxprom33, !dbg !280
  store i32 0, i32* %arrayidx34, align 4, !dbg !283
  br label %for.inc35, !dbg !284

for.inc35:                                        ; preds = %for.body32
  %22 = load i32, i32* %i24, align 4, !dbg !285
  %inc36 = add nsw i32 %22, 1, !dbg !285
  store i32 %inc36, i32* %i24, align 4, !dbg !285
  br label %for.cond30, !dbg !286, !llvm.loop !287

for.end37:                                        ; preds = %for.cond30
  %23 = load i32, i32* %data, align 4, !dbg !289
  %cmp38 = icmp sge i32 %23, 0, !dbg !291
  br i1 %cmp38, label %land.lhs.true39, label %if.else52, !dbg !292

land.lhs.true39:                                  ; preds = %for.end37
  %24 = load i32, i32* %data, align 4, !dbg !293
  %cmp40 = icmp slt i32 %24, 10, !dbg !294
  br i1 %cmp40, label %if.then41, label %if.else52, !dbg !295

if.then41:                                        ; preds = %land.lhs.true39
  %25 = load i32*, i32** %buffer25, align 8, !dbg !296
  %26 = load i32, i32* %data, align 4, !dbg !298
  %idxprom42 = sext i32 %26 to i64, !dbg !296
  %arrayidx43 = getelementptr inbounds i32, i32* %25, i64 %idxprom42, !dbg !296
  store i32 1, i32* %arrayidx43, align 4, !dbg !299
  store i32 0, i32* %i24, align 4, !dbg !300
  br label %for.cond44, !dbg !302

for.cond44:                                       ; preds = %for.inc49, %if.then41
  %27 = load i32, i32* %i24, align 4, !dbg !303
  %cmp45 = icmp slt i32 %27, 10, !dbg !305
  br i1 %cmp45, label %for.body46, label %for.end51, !dbg !306

for.body46:                                       ; preds = %for.cond44
  %28 = load i32*, i32** %buffer25, align 8, !dbg !307
  %29 = load i32, i32* %i24, align 4, !dbg !309
  %idxprom47 = sext i32 %29 to i64, !dbg !307
  %arrayidx48 = getelementptr inbounds i32, i32* %28, i64 %idxprom47, !dbg !307
  %30 = load i32, i32* %arrayidx48, align 4, !dbg !307
  call void @printIntLine(i32 noundef %30), !dbg !310
  br label %for.inc49, !dbg !311

for.inc49:                                        ; preds = %for.body46
  %31 = load i32, i32* %i24, align 4, !dbg !312
  %inc50 = add nsw i32 %31, 1, !dbg !312
  store i32 %inc50, i32* %i24, align 4, !dbg !312
  br label %for.cond44, !dbg !313, !llvm.loop !314

for.end51:                                        ; preds = %for.cond44
  br label %if.end53, !dbg !316

if.else52:                                        ; preds = %land.lhs.true39, %for.end37
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !317
  br label %if.end53

if.end53:                                         ; preds = %if.else52, %for.end51
  %32 = load i32*, i32** %buffer25, align 8, !dbg !319
  %33 = bitcast i32* %32 to i8*, !dbg !319
  call void @free(i8* noundef %33), !dbg !320
  br label %if.end54

if.end54:                                         ; preds = %if.end53, %if.end22
  ret void, !dbg !321
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !322 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  %i23 = alloca i32, align 4
  %buffer24 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !323, metadata !DIExpression()), !dbg !324
  store i32 -1, i32* %data, align 4, !dbg !325
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !326
  %tobool = icmp ne i32 %call, 0, !dbg !326
  br i1 %tobool, label %if.then, label %if.else, !dbg !328

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !329
  br label %if.end, !dbg !331

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !332
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !334
  %tobool2 = icmp ne i32 %call1, 0, !dbg !334
  br i1 %tobool2, label %if.then3, label %if.else22, !dbg !336

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !337, metadata !DIExpression()), !dbg !340
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !341, metadata !DIExpression()), !dbg !342
  %call4 = call i8* @malloc(i64 noundef 40) #5, !dbg !343
  %0 = bitcast i8* %call4 to i32*, !dbg !344
  store i32* %0, i32** %buffer, align 8, !dbg !342
  %1 = load i32*, i32** %buffer, align 8, !dbg !345
  %cmp = icmp eq i32* %1, null, !dbg !347
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !348

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 noundef -1) #6, !dbg !349
  unreachable, !dbg !349

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !351
  br label %for.cond, !dbg !353

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !354
  %cmp7 = icmp slt i32 %2, 10, !dbg !356
  br i1 %cmp7, label %for.body, label %for.end, !dbg !357

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !358
  %4 = load i32, i32* %i, align 4, !dbg !360
  %idxprom = sext i32 %4 to i64, !dbg !358
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !358
  store i32 0, i32* %arrayidx, align 4, !dbg !361
  br label %for.inc, !dbg !362

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !363
  %inc = add nsw i32 %5, 1, !dbg !363
  store i32 %inc, i32* %i, align 4, !dbg !363
  br label %for.cond, !dbg !364, !llvm.loop !365

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !367
  %cmp8 = icmp sge i32 %6, 0, !dbg !369
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !370

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !371
  %8 = load i32, i32* %data, align 4, !dbg !373
  %idxprom10 = sext i32 %8 to i64, !dbg !371
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !371
  store i32 1, i32* %arrayidx11, align 4, !dbg !374
  store i32 0, i32* %i, align 4, !dbg !375
  br label %for.cond12, !dbg !377

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !378
  %cmp13 = icmp slt i32 %9, 10, !dbg !380
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !381

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !382
  %11 = load i32, i32* %i, align 4, !dbg !384
  %idxprom15 = sext i32 %11 to i64, !dbg !382
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !382
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !382
  call void @printIntLine(i32 noundef %12), !dbg !385
  br label %for.inc17, !dbg !386

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !387
  %inc18 = add nsw i32 %13, 1, !dbg !387
  store i32 %inc18, i32* %i, align 4, !dbg !387
  br label %for.cond12, !dbg !388, !llvm.loop !389

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !391

if.else20:                                        ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !392
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !394
  %15 = bitcast i32* %14 to i8*, !dbg !394
  call void @free(i8* noundef %15), !dbg !395
  br label %if.end51, !dbg !396

if.else22:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i23, metadata !397, metadata !DIExpression()), !dbg !400
  call void @llvm.dbg.declare(metadata i32** %buffer24, metadata !401, metadata !DIExpression()), !dbg !402
  %call25 = call i8* @malloc(i64 noundef 40) #5, !dbg !403
  %16 = bitcast i8* %call25 to i32*, !dbg !404
  store i32* %16, i32** %buffer24, align 8, !dbg !402
  %17 = load i32*, i32** %buffer24, align 8, !dbg !405
  %cmp26 = icmp eq i32* %17, null, !dbg !407
  br i1 %cmp26, label %if.then27, label %if.end28, !dbg !408

if.then27:                                        ; preds = %if.else22
  call void @exit(i32 noundef -1) #6, !dbg !409
  unreachable, !dbg !409

if.end28:                                         ; preds = %if.else22
  store i32 0, i32* %i23, align 4, !dbg !411
  br label %for.cond29, !dbg !413

for.cond29:                                       ; preds = %for.inc34, %if.end28
  %18 = load i32, i32* %i23, align 4, !dbg !414
  %cmp30 = icmp slt i32 %18, 10, !dbg !416
  br i1 %cmp30, label %for.body31, label %for.end36, !dbg !417

for.body31:                                       ; preds = %for.cond29
  %19 = load i32*, i32** %buffer24, align 8, !dbg !418
  %20 = load i32, i32* %i23, align 4, !dbg !420
  %idxprom32 = sext i32 %20 to i64, !dbg !418
  %arrayidx33 = getelementptr inbounds i32, i32* %19, i64 %idxprom32, !dbg !418
  store i32 0, i32* %arrayidx33, align 4, !dbg !421
  br label %for.inc34, !dbg !422

for.inc34:                                        ; preds = %for.body31
  %21 = load i32, i32* %i23, align 4, !dbg !423
  %inc35 = add nsw i32 %21, 1, !dbg !423
  store i32 %inc35, i32* %i23, align 4, !dbg !423
  br label %for.cond29, !dbg !424, !llvm.loop !425

for.end36:                                        ; preds = %for.cond29
  %22 = load i32, i32* %data, align 4, !dbg !427
  %cmp37 = icmp sge i32 %22, 0, !dbg !429
  br i1 %cmp37, label %if.then38, label %if.else49, !dbg !430

if.then38:                                        ; preds = %for.end36
  %23 = load i32*, i32** %buffer24, align 8, !dbg !431
  %24 = load i32, i32* %data, align 4, !dbg !433
  %idxprom39 = sext i32 %24 to i64, !dbg !431
  %arrayidx40 = getelementptr inbounds i32, i32* %23, i64 %idxprom39, !dbg !431
  store i32 1, i32* %arrayidx40, align 4, !dbg !434
  store i32 0, i32* %i23, align 4, !dbg !435
  br label %for.cond41, !dbg !437

for.cond41:                                       ; preds = %for.inc46, %if.then38
  %25 = load i32, i32* %i23, align 4, !dbg !438
  %cmp42 = icmp slt i32 %25, 10, !dbg !440
  br i1 %cmp42, label %for.body43, label %for.end48, !dbg !441

for.body43:                                       ; preds = %for.cond41
  %26 = load i32*, i32** %buffer24, align 8, !dbg !442
  %27 = load i32, i32* %i23, align 4, !dbg !444
  %idxprom44 = sext i32 %27 to i64, !dbg !442
  %arrayidx45 = getelementptr inbounds i32, i32* %26, i64 %idxprom44, !dbg !442
  %28 = load i32, i32* %arrayidx45, align 4, !dbg !442
  call void @printIntLine(i32 noundef %28), !dbg !445
  br label %for.inc46, !dbg !446

for.inc46:                                        ; preds = %for.body43
  %29 = load i32, i32* %i23, align 4, !dbg !447
  %inc47 = add nsw i32 %29, 1, !dbg !447
  store i32 %inc47, i32* %i23, align 4, !dbg !447
  br label %for.cond41, !dbg !448, !llvm.loop !449

for.end48:                                        ; preds = %for.cond41
  br label %if.end50, !dbg !451

if.else49:                                        ; preds = %for.end36
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !452
  br label %if.end50

if.end50:                                         ; preds = %if.else49, %for.end48
  %30 = load i32*, i32** %buffer24, align 8, !dbg !454
  %31 = bitcast i32* %30 to i8*, !dbg !454
  call void @free(i8* noundef %31), !dbg !455
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.end21
  ret void, !dbg !456
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { allocsize(0) }
attributes #6 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5, !6}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_12_bad", scope: !15, file: !15, line: 22, type: !16, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 24, type: !4)
!20 = !DILocation(line: 24, column: 9, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 27, column: 8, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!24 = !DILocation(line: 27, column: 8, scope: !14)
!25 = !DILocation(line: 30, column: 14, scope: !26)
!26 = distinct !DILexicalBlock(scope: !23, file: !15, line: 28, column: 5)
!27 = !DILocation(line: 31, column: 5, scope: !26)
!28 = !DILocation(line: 36, column: 14, scope: !29)
!29 = distinct !DILexicalBlock(scope: !23, file: !15, line: 33, column: 5)
!30 = !DILocation(line: 38, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 8)
!32 = !DILocation(line: 38, column: 8, scope: !14)
!33 = !DILocalVariable(name: "i", scope: !34, file: !15, line: 41, type: !4)
!34 = distinct !DILexicalBlock(scope: !35, file: !15, line: 40, column: 9)
!35 = distinct !DILexicalBlock(scope: !31, file: !15, line: 39, column: 5)
!36 = !DILocation(line: 41, column: 17, scope: !34)
!37 = !DILocalVariable(name: "buffer", scope: !34, file: !15, line: 42, type: !3)
!38 = !DILocation(line: 42, column: 19, scope: !34)
!39 = !DILocation(line: 42, column: 35, scope: !34)
!40 = !DILocation(line: 42, column: 28, scope: !34)
!41 = !DILocation(line: 43, column: 17, scope: !42)
!42 = distinct !DILexicalBlock(scope: !34, file: !15, line: 43, column: 17)
!43 = !DILocation(line: 43, column: 24, scope: !42)
!44 = !DILocation(line: 43, column: 17, scope: !34)
!45 = !DILocation(line: 43, column: 34, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !15, line: 43, column: 33)
!47 = !DILocation(line: 45, column: 20, scope: !48)
!48 = distinct !DILexicalBlock(scope: !34, file: !15, line: 45, column: 13)
!49 = !DILocation(line: 45, column: 18, scope: !48)
!50 = !DILocation(line: 45, column: 25, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !15, line: 45, column: 13)
!52 = !DILocation(line: 45, column: 27, scope: !51)
!53 = !DILocation(line: 45, column: 13, scope: !48)
!54 = !DILocation(line: 47, column: 17, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !15, line: 46, column: 13)
!56 = !DILocation(line: 47, column: 24, scope: !55)
!57 = !DILocation(line: 47, column: 27, scope: !55)
!58 = !DILocation(line: 48, column: 13, scope: !55)
!59 = !DILocation(line: 45, column: 34, scope: !51)
!60 = !DILocation(line: 45, column: 13, scope: !51)
!61 = distinct !{!61, !53, !62, !63}
!62 = !DILocation(line: 48, column: 13, scope: !48)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 51, column: 17, scope: !65)
!65 = distinct !DILexicalBlock(scope: !34, file: !15, line: 51, column: 17)
!66 = !DILocation(line: 51, column: 22, scope: !65)
!67 = !DILocation(line: 51, column: 17, scope: !34)
!68 = !DILocation(line: 53, column: 17, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !15, line: 52, column: 13)
!70 = !DILocation(line: 53, column: 24, scope: !69)
!71 = !DILocation(line: 53, column: 30, scope: !69)
!72 = !DILocation(line: 55, column: 23, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !15, line: 55, column: 17)
!74 = !DILocation(line: 55, column: 21, scope: !73)
!75 = !DILocation(line: 55, column: 28, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !15, line: 55, column: 17)
!77 = !DILocation(line: 55, column: 30, scope: !76)
!78 = !DILocation(line: 55, column: 17, scope: !73)
!79 = !DILocation(line: 57, column: 34, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !15, line: 56, column: 17)
!81 = !DILocation(line: 57, column: 41, scope: !80)
!82 = !DILocation(line: 57, column: 21, scope: !80)
!83 = !DILocation(line: 58, column: 17, scope: !80)
!84 = !DILocation(line: 55, column: 37, scope: !76)
!85 = !DILocation(line: 55, column: 17, scope: !76)
!86 = distinct !{!86, !78, !87, !63}
!87 = !DILocation(line: 58, column: 17, scope: !73)
!88 = !DILocation(line: 59, column: 13, scope: !69)
!89 = !DILocation(line: 62, column: 17, scope: !90)
!90 = distinct !DILexicalBlock(scope: !65, file: !15, line: 61, column: 13)
!91 = !DILocation(line: 64, column: 18, scope: !34)
!92 = !DILocation(line: 64, column: 13, scope: !34)
!93 = !DILocation(line: 66, column: 5, scope: !35)
!94 = !DILocalVariable(name: "i", scope: !95, file: !15, line: 70, type: !4)
!95 = distinct !DILexicalBlock(scope: !96, file: !15, line: 69, column: 9)
!96 = distinct !DILexicalBlock(scope: !31, file: !15, line: 68, column: 5)
!97 = !DILocation(line: 70, column: 17, scope: !95)
!98 = !DILocalVariable(name: "buffer", scope: !95, file: !15, line: 71, type: !3)
!99 = !DILocation(line: 71, column: 19, scope: !95)
!100 = !DILocation(line: 71, column: 35, scope: !95)
!101 = !DILocation(line: 71, column: 28, scope: !95)
!102 = !DILocation(line: 72, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !95, file: !15, line: 72, column: 17)
!104 = !DILocation(line: 72, column: 24, scope: !103)
!105 = !DILocation(line: 72, column: 17, scope: !95)
!106 = !DILocation(line: 72, column: 34, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !15, line: 72, column: 33)
!108 = !DILocation(line: 74, column: 20, scope: !109)
!109 = distinct !DILexicalBlock(scope: !95, file: !15, line: 74, column: 13)
!110 = !DILocation(line: 74, column: 18, scope: !109)
!111 = !DILocation(line: 74, column: 25, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !15, line: 74, column: 13)
!113 = !DILocation(line: 74, column: 27, scope: !112)
!114 = !DILocation(line: 74, column: 13, scope: !109)
!115 = !DILocation(line: 76, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !15, line: 75, column: 13)
!117 = !DILocation(line: 76, column: 24, scope: !116)
!118 = !DILocation(line: 76, column: 27, scope: !116)
!119 = !DILocation(line: 77, column: 13, scope: !116)
!120 = !DILocation(line: 74, column: 34, scope: !112)
!121 = !DILocation(line: 74, column: 13, scope: !112)
!122 = distinct !{!122, !114, !123, !63}
!123 = !DILocation(line: 77, column: 13, scope: !109)
!124 = !DILocation(line: 79, column: 17, scope: !125)
!125 = distinct !DILexicalBlock(scope: !95, file: !15, line: 79, column: 17)
!126 = !DILocation(line: 79, column: 22, scope: !125)
!127 = !DILocation(line: 79, column: 27, scope: !125)
!128 = !DILocation(line: 79, column: 30, scope: !125)
!129 = !DILocation(line: 79, column: 35, scope: !125)
!130 = !DILocation(line: 79, column: 17, scope: !95)
!131 = !DILocation(line: 81, column: 17, scope: !132)
!132 = distinct !DILexicalBlock(scope: !125, file: !15, line: 80, column: 13)
!133 = !DILocation(line: 81, column: 24, scope: !132)
!134 = !DILocation(line: 81, column: 30, scope: !132)
!135 = !DILocation(line: 83, column: 23, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !15, line: 83, column: 17)
!137 = !DILocation(line: 83, column: 21, scope: !136)
!138 = !DILocation(line: 83, column: 28, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !15, line: 83, column: 17)
!140 = !DILocation(line: 83, column: 30, scope: !139)
!141 = !DILocation(line: 83, column: 17, scope: !136)
!142 = !DILocation(line: 85, column: 34, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !15, line: 84, column: 17)
!144 = !DILocation(line: 85, column: 41, scope: !143)
!145 = !DILocation(line: 85, column: 21, scope: !143)
!146 = !DILocation(line: 86, column: 17, scope: !143)
!147 = !DILocation(line: 83, column: 37, scope: !139)
!148 = !DILocation(line: 83, column: 17, scope: !139)
!149 = distinct !{!149, !141, !150, !63}
!150 = !DILocation(line: 86, column: 17, scope: !136)
!151 = !DILocation(line: 87, column: 13, scope: !132)
!152 = !DILocation(line: 90, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !125, file: !15, line: 89, column: 13)
!154 = !DILocation(line: 92, column: 18, scope: !95)
!155 = !DILocation(line: 92, column: 13, scope: !95)
!156 = !DILocation(line: 95, column: 1, scope: !14)
!157 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_large_12_good", scope: !15, file: !15, line: 257, type: !16, scopeLine: 258, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!158 = !DILocation(line: 259, column: 5, scope: !157)
!159 = !DILocation(line: 260, column: 5, scope: !157)
!160 = !DILocation(line: 261, column: 1, scope: !157)
!161 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 272, type: !162, scopeLine: 273, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!162 = !DISubroutineType(types: !163)
!163 = !{!4, !4, !164}
!164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !165, size: 64)
!165 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !166, size: 64)
!166 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!167 = !DILocalVariable(name: "argc", arg: 1, scope: !161, file: !15, line: 272, type: !4)
!168 = !DILocation(line: 272, column: 14, scope: !161)
!169 = !DILocalVariable(name: "argv", arg: 2, scope: !161, file: !15, line: 272, type: !164)
!170 = !DILocation(line: 272, column: 27, scope: !161)
!171 = !DILocation(line: 275, column: 22, scope: !161)
!172 = !DILocation(line: 275, column: 12, scope: !161)
!173 = !DILocation(line: 275, column: 5, scope: !161)
!174 = !DILocation(line: 277, column: 5, scope: !161)
!175 = !DILocation(line: 278, column: 5, scope: !161)
!176 = !DILocation(line: 279, column: 5, scope: !161)
!177 = !DILocation(line: 282, column: 5, scope: !161)
!178 = !DILocation(line: 283, column: 5, scope: !161)
!179 = !DILocation(line: 284, column: 5, scope: !161)
!180 = !DILocation(line: 286, column: 5, scope: !161)
!181 = distinct !DISubprogram(name: "goodB2G", scope: !15, file: !15, line: 104, type: !16, scopeLine: 105, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!182 = !DILocalVariable(name: "data", scope: !181, file: !15, line: 106, type: !4)
!183 = !DILocation(line: 106, column: 9, scope: !181)
!184 = !DILocation(line: 108, column: 10, scope: !181)
!185 = !DILocation(line: 109, column: 8, scope: !186)
!186 = distinct !DILexicalBlock(scope: !181, file: !15, line: 109, column: 8)
!187 = !DILocation(line: 109, column: 8, scope: !181)
!188 = !DILocation(line: 112, column: 14, scope: !189)
!189 = distinct !DILexicalBlock(scope: !186, file: !15, line: 110, column: 5)
!190 = !DILocation(line: 113, column: 5, scope: !189)
!191 = !DILocation(line: 117, column: 14, scope: !192)
!192 = distinct !DILexicalBlock(scope: !186, file: !15, line: 115, column: 5)
!193 = !DILocation(line: 119, column: 8, scope: !194)
!194 = distinct !DILexicalBlock(scope: !181, file: !15, line: 119, column: 8)
!195 = !DILocation(line: 119, column: 8, scope: !181)
!196 = !DILocalVariable(name: "i", scope: !197, file: !15, line: 122, type: !4)
!197 = distinct !DILexicalBlock(scope: !198, file: !15, line: 121, column: 9)
!198 = distinct !DILexicalBlock(scope: !194, file: !15, line: 120, column: 5)
!199 = !DILocation(line: 122, column: 17, scope: !197)
!200 = !DILocalVariable(name: "buffer", scope: !197, file: !15, line: 123, type: !3)
!201 = !DILocation(line: 123, column: 19, scope: !197)
!202 = !DILocation(line: 123, column: 35, scope: !197)
!203 = !DILocation(line: 123, column: 28, scope: !197)
!204 = !DILocation(line: 124, column: 17, scope: !205)
!205 = distinct !DILexicalBlock(scope: !197, file: !15, line: 124, column: 17)
!206 = !DILocation(line: 124, column: 24, scope: !205)
!207 = !DILocation(line: 124, column: 17, scope: !197)
!208 = !DILocation(line: 124, column: 34, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !15, line: 124, column: 33)
!210 = !DILocation(line: 126, column: 20, scope: !211)
!211 = distinct !DILexicalBlock(scope: !197, file: !15, line: 126, column: 13)
!212 = !DILocation(line: 126, column: 18, scope: !211)
!213 = !DILocation(line: 126, column: 25, scope: !214)
!214 = distinct !DILexicalBlock(scope: !211, file: !15, line: 126, column: 13)
!215 = !DILocation(line: 126, column: 27, scope: !214)
!216 = !DILocation(line: 126, column: 13, scope: !211)
!217 = !DILocation(line: 128, column: 17, scope: !218)
!218 = distinct !DILexicalBlock(scope: !214, file: !15, line: 127, column: 13)
!219 = !DILocation(line: 128, column: 24, scope: !218)
!220 = !DILocation(line: 128, column: 27, scope: !218)
!221 = !DILocation(line: 129, column: 13, scope: !218)
!222 = !DILocation(line: 126, column: 34, scope: !214)
!223 = !DILocation(line: 126, column: 13, scope: !214)
!224 = distinct !{!224, !216, !225, !63}
!225 = !DILocation(line: 129, column: 13, scope: !211)
!226 = !DILocation(line: 131, column: 17, scope: !227)
!227 = distinct !DILexicalBlock(scope: !197, file: !15, line: 131, column: 17)
!228 = !DILocation(line: 131, column: 22, scope: !227)
!229 = !DILocation(line: 131, column: 27, scope: !227)
!230 = !DILocation(line: 131, column: 30, scope: !227)
!231 = !DILocation(line: 131, column: 35, scope: !227)
!232 = !DILocation(line: 131, column: 17, scope: !197)
!233 = !DILocation(line: 133, column: 17, scope: !234)
!234 = distinct !DILexicalBlock(scope: !227, file: !15, line: 132, column: 13)
!235 = !DILocation(line: 133, column: 24, scope: !234)
!236 = !DILocation(line: 133, column: 30, scope: !234)
!237 = !DILocation(line: 135, column: 23, scope: !238)
!238 = distinct !DILexicalBlock(scope: !234, file: !15, line: 135, column: 17)
!239 = !DILocation(line: 135, column: 21, scope: !238)
!240 = !DILocation(line: 135, column: 28, scope: !241)
!241 = distinct !DILexicalBlock(scope: !238, file: !15, line: 135, column: 17)
!242 = !DILocation(line: 135, column: 30, scope: !241)
!243 = !DILocation(line: 135, column: 17, scope: !238)
!244 = !DILocation(line: 137, column: 34, scope: !245)
!245 = distinct !DILexicalBlock(scope: !241, file: !15, line: 136, column: 17)
!246 = !DILocation(line: 137, column: 41, scope: !245)
!247 = !DILocation(line: 137, column: 21, scope: !245)
!248 = !DILocation(line: 138, column: 17, scope: !245)
!249 = !DILocation(line: 135, column: 37, scope: !241)
!250 = !DILocation(line: 135, column: 17, scope: !241)
!251 = distinct !{!251, !243, !252, !63}
!252 = !DILocation(line: 138, column: 17, scope: !238)
!253 = !DILocation(line: 139, column: 13, scope: !234)
!254 = !DILocation(line: 142, column: 17, scope: !255)
!255 = distinct !DILexicalBlock(scope: !227, file: !15, line: 141, column: 13)
!256 = !DILocation(line: 144, column: 18, scope: !197)
!257 = !DILocation(line: 144, column: 13, scope: !197)
!258 = !DILocation(line: 146, column: 5, scope: !198)
!259 = !DILocalVariable(name: "i", scope: !260, file: !15, line: 150, type: !4)
!260 = distinct !DILexicalBlock(scope: !261, file: !15, line: 149, column: 9)
!261 = distinct !DILexicalBlock(scope: !194, file: !15, line: 148, column: 5)
!262 = !DILocation(line: 150, column: 17, scope: !260)
!263 = !DILocalVariable(name: "buffer", scope: !260, file: !15, line: 151, type: !3)
!264 = !DILocation(line: 151, column: 19, scope: !260)
!265 = !DILocation(line: 151, column: 35, scope: !260)
!266 = !DILocation(line: 151, column: 28, scope: !260)
!267 = !DILocation(line: 152, column: 17, scope: !268)
!268 = distinct !DILexicalBlock(scope: !260, file: !15, line: 152, column: 17)
!269 = !DILocation(line: 152, column: 24, scope: !268)
!270 = !DILocation(line: 152, column: 17, scope: !260)
!271 = !DILocation(line: 152, column: 34, scope: !272)
!272 = distinct !DILexicalBlock(scope: !268, file: !15, line: 152, column: 33)
!273 = !DILocation(line: 154, column: 20, scope: !274)
!274 = distinct !DILexicalBlock(scope: !260, file: !15, line: 154, column: 13)
!275 = !DILocation(line: 154, column: 18, scope: !274)
!276 = !DILocation(line: 154, column: 25, scope: !277)
!277 = distinct !DILexicalBlock(scope: !274, file: !15, line: 154, column: 13)
!278 = !DILocation(line: 154, column: 27, scope: !277)
!279 = !DILocation(line: 154, column: 13, scope: !274)
!280 = !DILocation(line: 156, column: 17, scope: !281)
!281 = distinct !DILexicalBlock(scope: !277, file: !15, line: 155, column: 13)
!282 = !DILocation(line: 156, column: 24, scope: !281)
!283 = !DILocation(line: 156, column: 27, scope: !281)
!284 = !DILocation(line: 157, column: 13, scope: !281)
!285 = !DILocation(line: 154, column: 34, scope: !277)
!286 = !DILocation(line: 154, column: 13, scope: !277)
!287 = distinct !{!287, !279, !288, !63}
!288 = !DILocation(line: 157, column: 13, scope: !274)
!289 = !DILocation(line: 159, column: 17, scope: !290)
!290 = distinct !DILexicalBlock(scope: !260, file: !15, line: 159, column: 17)
!291 = !DILocation(line: 159, column: 22, scope: !290)
!292 = !DILocation(line: 159, column: 27, scope: !290)
!293 = !DILocation(line: 159, column: 30, scope: !290)
!294 = !DILocation(line: 159, column: 35, scope: !290)
!295 = !DILocation(line: 159, column: 17, scope: !260)
!296 = !DILocation(line: 161, column: 17, scope: !297)
!297 = distinct !DILexicalBlock(scope: !290, file: !15, line: 160, column: 13)
!298 = !DILocation(line: 161, column: 24, scope: !297)
!299 = !DILocation(line: 161, column: 30, scope: !297)
!300 = !DILocation(line: 163, column: 23, scope: !301)
!301 = distinct !DILexicalBlock(scope: !297, file: !15, line: 163, column: 17)
!302 = !DILocation(line: 163, column: 21, scope: !301)
!303 = !DILocation(line: 163, column: 28, scope: !304)
!304 = distinct !DILexicalBlock(scope: !301, file: !15, line: 163, column: 17)
!305 = !DILocation(line: 163, column: 30, scope: !304)
!306 = !DILocation(line: 163, column: 17, scope: !301)
!307 = !DILocation(line: 165, column: 34, scope: !308)
!308 = distinct !DILexicalBlock(scope: !304, file: !15, line: 164, column: 17)
!309 = !DILocation(line: 165, column: 41, scope: !308)
!310 = !DILocation(line: 165, column: 21, scope: !308)
!311 = !DILocation(line: 166, column: 17, scope: !308)
!312 = !DILocation(line: 163, column: 37, scope: !304)
!313 = !DILocation(line: 163, column: 17, scope: !304)
!314 = distinct !{!314, !306, !315, !63}
!315 = !DILocation(line: 166, column: 17, scope: !301)
!316 = !DILocation(line: 167, column: 13, scope: !297)
!317 = !DILocation(line: 170, column: 17, scope: !318)
!318 = distinct !DILexicalBlock(scope: !290, file: !15, line: 169, column: 13)
!319 = !DILocation(line: 172, column: 18, scope: !260)
!320 = !DILocation(line: 172, column: 13, scope: !260)
!321 = !DILocation(line: 175, column: 1, scope: !181)
!322 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 180, type: !16, scopeLine: 181, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!323 = !DILocalVariable(name: "data", scope: !322, file: !15, line: 182, type: !4)
!324 = !DILocation(line: 182, column: 9, scope: !322)
!325 = !DILocation(line: 184, column: 10, scope: !322)
!326 = !DILocation(line: 185, column: 8, scope: !327)
!327 = distinct !DILexicalBlock(scope: !322, file: !15, line: 185, column: 8)
!328 = !DILocation(line: 185, column: 8, scope: !322)
!329 = !DILocation(line: 189, column: 14, scope: !330)
!330 = distinct !DILexicalBlock(scope: !327, file: !15, line: 186, column: 5)
!331 = !DILocation(line: 190, column: 5, scope: !330)
!332 = !DILocation(line: 195, column: 14, scope: !333)
!333 = distinct !DILexicalBlock(scope: !327, file: !15, line: 192, column: 5)
!334 = !DILocation(line: 197, column: 8, scope: !335)
!335 = distinct !DILexicalBlock(scope: !322, file: !15, line: 197, column: 8)
!336 = !DILocation(line: 197, column: 8, scope: !322)
!337 = !DILocalVariable(name: "i", scope: !338, file: !15, line: 200, type: !4)
!338 = distinct !DILexicalBlock(scope: !339, file: !15, line: 199, column: 9)
!339 = distinct !DILexicalBlock(scope: !335, file: !15, line: 198, column: 5)
!340 = !DILocation(line: 200, column: 17, scope: !338)
!341 = !DILocalVariable(name: "buffer", scope: !338, file: !15, line: 201, type: !3)
!342 = !DILocation(line: 201, column: 19, scope: !338)
!343 = !DILocation(line: 201, column: 35, scope: !338)
!344 = !DILocation(line: 201, column: 28, scope: !338)
!345 = !DILocation(line: 202, column: 17, scope: !346)
!346 = distinct !DILexicalBlock(scope: !338, file: !15, line: 202, column: 17)
!347 = !DILocation(line: 202, column: 24, scope: !346)
!348 = !DILocation(line: 202, column: 17, scope: !338)
!349 = !DILocation(line: 202, column: 34, scope: !350)
!350 = distinct !DILexicalBlock(scope: !346, file: !15, line: 202, column: 33)
!351 = !DILocation(line: 204, column: 20, scope: !352)
!352 = distinct !DILexicalBlock(scope: !338, file: !15, line: 204, column: 13)
!353 = !DILocation(line: 204, column: 18, scope: !352)
!354 = !DILocation(line: 204, column: 25, scope: !355)
!355 = distinct !DILexicalBlock(scope: !352, file: !15, line: 204, column: 13)
!356 = !DILocation(line: 204, column: 27, scope: !355)
!357 = !DILocation(line: 204, column: 13, scope: !352)
!358 = !DILocation(line: 206, column: 17, scope: !359)
!359 = distinct !DILexicalBlock(scope: !355, file: !15, line: 205, column: 13)
!360 = !DILocation(line: 206, column: 24, scope: !359)
!361 = !DILocation(line: 206, column: 27, scope: !359)
!362 = !DILocation(line: 207, column: 13, scope: !359)
!363 = !DILocation(line: 204, column: 34, scope: !355)
!364 = !DILocation(line: 204, column: 13, scope: !355)
!365 = distinct !{!365, !357, !366, !63}
!366 = !DILocation(line: 207, column: 13, scope: !352)
!367 = !DILocation(line: 210, column: 17, scope: !368)
!368 = distinct !DILexicalBlock(scope: !338, file: !15, line: 210, column: 17)
!369 = !DILocation(line: 210, column: 22, scope: !368)
!370 = !DILocation(line: 210, column: 17, scope: !338)
!371 = !DILocation(line: 212, column: 17, scope: !372)
!372 = distinct !DILexicalBlock(scope: !368, file: !15, line: 211, column: 13)
!373 = !DILocation(line: 212, column: 24, scope: !372)
!374 = !DILocation(line: 212, column: 30, scope: !372)
!375 = !DILocation(line: 214, column: 23, scope: !376)
!376 = distinct !DILexicalBlock(scope: !372, file: !15, line: 214, column: 17)
!377 = !DILocation(line: 214, column: 21, scope: !376)
!378 = !DILocation(line: 214, column: 28, scope: !379)
!379 = distinct !DILexicalBlock(scope: !376, file: !15, line: 214, column: 17)
!380 = !DILocation(line: 214, column: 30, scope: !379)
!381 = !DILocation(line: 214, column: 17, scope: !376)
!382 = !DILocation(line: 216, column: 34, scope: !383)
!383 = distinct !DILexicalBlock(scope: !379, file: !15, line: 215, column: 17)
!384 = !DILocation(line: 216, column: 41, scope: !383)
!385 = !DILocation(line: 216, column: 21, scope: !383)
!386 = !DILocation(line: 217, column: 17, scope: !383)
!387 = !DILocation(line: 214, column: 37, scope: !379)
!388 = !DILocation(line: 214, column: 17, scope: !379)
!389 = distinct !{!389, !381, !390, !63}
!390 = !DILocation(line: 217, column: 17, scope: !376)
!391 = !DILocation(line: 218, column: 13, scope: !372)
!392 = !DILocation(line: 221, column: 17, scope: !393)
!393 = distinct !DILexicalBlock(scope: !368, file: !15, line: 220, column: 13)
!394 = !DILocation(line: 223, column: 18, scope: !338)
!395 = !DILocation(line: 223, column: 13, scope: !338)
!396 = !DILocation(line: 225, column: 5, scope: !339)
!397 = !DILocalVariable(name: "i", scope: !398, file: !15, line: 229, type: !4)
!398 = distinct !DILexicalBlock(scope: !399, file: !15, line: 228, column: 9)
!399 = distinct !DILexicalBlock(scope: !335, file: !15, line: 227, column: 5)
!400 = !DILocation(line: 229, column: 17, scope: !398)
!401 = !DILocalVariable(name: "buffer", scope: !398, file: !15, line: 230, type: !3)
!402 = !DILocation(line: 230, column: 19, scope: !398)
!403 = !DILocation(line: 230, column: 35, scope: !398)
!404 = !DILocation(line: 230, column: 28, scope: !398)
!405 = !DILocation(line: 231, column: 17, scope: !406)
!406 = distinct !DILexicalBlock(scope: !398, file: !15, line: 231, column: 17)
!407 = !DILocation(line: 231, column: 24, scope: !406)
!408 = !DILocation(line: 231, column: 17, scope: !398)
!409 = !DILocation(line: 231, column: 34, scope: !410)
!410 = distinct !DILexicalBlock(scope: !406, file: !15, line: 231, column: 33)
!411 = !DILocation(line: 233, column: 20, scope: !412)
!412 = distinct !DILexicalBlock(scope: !398, file: !15, line: 233, column: 13)
!413 = !DILocation(line: 233, column: 18, scope: !412)
!414 = !DILocation(line: 233, column: 25, scope: !415)
!415 = distinct !DILexicalBlock(scope: !412, file: !15, line: 233, column: 13)
!416 = !DILocation(line: 233, column: 27, scope: !415)
!417 = !DILocation(line: 233, column: 13, scope: !412)
!418 = !DILocation(line: 235, column: 17, scope: !419)
!419 = distinct !DILexicalBlock(scope: !415, file: !15, line: 234, column: 13)
!420 = !DILocation(line: 235, column: 24, scope: !419)
!421 = !DILocation(line: 235, column: 27, scope: !419)
!422 = !DILocation(line: 236, column: 13, scope: !419)
!423 = !DILocation(line: 233, column: 34, scope: !415)
!424 = !DILocation(line: 233, column: 13, scope: !415)
!425 = distinct !{!425, !417, !426, !63}
!426 = !DILocation(line: 236, column: 13, scope: !412)
!427 = !DILocation(line: 239, column: 17, scope: !428)
!428 = distinct !DILexicalBlock(scope: !398, file: !15, line: 239, column: 17)
!429 = !DILocation(line: 239, column: 22, scope: !428)
!430 = !DILocation(line: 239, column: 17, scope: !398)
!431 = !DILocation(line: 241, column: 17, scope: !432)
!432 = distinct !DILexicalBlock(scope: !428, file: !15, line: 240, column: 13)
!433 = !DILocation(line: 241, column: 24, scope: !432)
!434 = !DILocation(line: 241, column: 30, scope: !432)
!435 = !DILocation(line: 243, column: 23, scope: !436)
!436 = distinct !DILexicalBlock(scope: !432, file: !15, line: 243, column: 17)
!437 = !DILocation(line: 243, column: 21, scope: !436)
!438 = !DILocation(line: 243, column: 28, scope: !439)
!439 = distinct !DILexicalBlock(scope: !436, file: !15, line: 243, column: 17)
!440 = !DILocation(line: 243, column: 30, scope: !439)
!441 = !DILocation(line: 243, column: 17, scope: !436)
!442 = !DILocation(line: 245, column: 34, scope: !443)
!443 = distinct !DILexicalBlock(scope: !439, file: !15, line: 244, column: 17)
!444 = !DILocation(line: 245, column: 41, scope: !443)
!445 = !DILocation(line: 245, column: 21, scope: !443)
!446 = !DILocation(line: 246, column: 17, scope: !443)
!447 = !DILocation(line: 243, column: 37, scope: !439)
!448 = !DILocation(line: 243, column: 17, scope: !439)
!449 = distinct !{!449, !441, !450, !63}
!450 = !DILocation(line: 246, column: 17, scope: !436)
!451 = !DILocation(line: 247, column: 13, scope: !432)
!452 = !DILocation(line: 250, column: 17, scope: !453)
!453 = distinct !DILexicalBlock(scope: !428, file: !15, line: 249, column: 13)
!454 = !DILocation(line: 252, column: 18, scope: !398)
!455 = !DILocation(line: 252, column: 13, scope: !398)
!456 = !DILocation(line: 255, column: 1, scope: !322)
