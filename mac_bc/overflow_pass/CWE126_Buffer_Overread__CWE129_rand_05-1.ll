; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_rand_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 -1, i32* %data, align 4, !dbg !24
  %0 = load i32, i32* @staticTrue, align 4, !dbg !25
  %tobool = icmp ne i32 %0, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  %call = call i32 @rand(), !dbg !28
  %and = and i32 %call, 1, !dbg !28
  %tobool1 = icmp ne i32 %and, 0, !dbg !28
  br i1 %tobool1, label %cond.true, label %cond.false, !dbg !28

cond.true:                                        ; preds = %if.then
  %call2 = call i32 @rand(), !dbg !28
  %shl = shl i32 %call2, 30, !dbg !28
  %call3 = call i32 @rand(), !dbg !28
  %shl4 = shl i32 %call3, 15, !dbg !28
  %xor = xor i32 %shl, %shl4, !dbg !28
  %call5 = call i32 @rand(), !dbg !28
  %xor6 = xor i32 %xor, %call5, !dbg !28
  br label %cond.end, !dbg !28

cond.false:                                       ; preds = %if.then
  %call7 = call i32 @rand(), !dbg !28
  %shl8 = shl i32 %call7, 30, !dbg !28
  %call9 = call i32 @rand(), !dbg !28
  %shl10 = shl i32 %call9, 15, !dbg !28
  %xor11 = xor i32 %shl8, %shl10, !dbg !28
  %call12 = call i32 @rand(), !dbg !28
  %xor13 = xor i32 %xor11, %call12, !dbg !28
  %sub = sub i32 0, %xor13, !dbg !28
  %sub14 = sub i32 %sub, 1, !dbg !28
  br label %cond.end, !dbg !28

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor6, %cond.true ], [ %sub14, %cond.false ], !dbg !28
  store i32 %cond, i32* %data, align 4, !dbg !30
  br label %if.end, !dbg !31

if.end:                                           ; preds = %cond.end, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !32
  %tobool15 = icmp ne i32 %1, 0, !dbg !32
  br i1 %tobool15, label %if.then16, label %if.end19, !dbg !34

if.then16:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !35, metadata !DIExpression()), !dbg !41
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !41
  %3 = load i32, i32* %data, align 4, !dbg !42
  %cmp = icmp sge i32 %3, 0, !dbg !44
  br i1 %cmp, label %if.then17, label %if.else, !dbg !45

if.then17:                                        ; preds = %if.then16
  %4 = load i32, i32* %data, align 4, !dbg !46
  %idxprom = sext i32 %4 to i64, !dbg !48
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !48
  %5 = load i32, i32* %arrayidx, align 4, !dbg !48
  call void @printIntLine(i32 noundef %5), !dbg !49
  br label %if.end18, !dbg !50

if.else:                                          ; preds = %if.then16
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !51
  br label %if.end18

if.end18:                                         ; preds = %if.else, %if.then17
  br label %if.end19, !dbg !53

if.end19:                                         ; preds = %if.end18, %if.end
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @rand() #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare void @printIntLine(i32 noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_rand_05_good() #0 !dbg !55 {
entry:
  call void @goodB2G1(), !dbg !56
  call void @goodB2G2(), !dbg !57
  call void @goodG2B1(), !dbg !58
  call void @goodG2B2(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* noundef null), !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 noundef %conv), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @CWE126_Buffer_Overread__CWE129_rand_05_good(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  call void @CWE126_Buffer_Overread__CWE129_rand_05_bad(), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !81 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !82, metadata !DIExpression()), !dbg !83
  store i32 -1, i32* %data, align 4, !dbg !84
  %0 = load i32, i32* @staticTrue, align 4, !dbg !85
  %tobool = icmp ne i32 %0, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %entry
  %call = call i32 @rand(), !dbg !88
  %and = and i32 %call, 1, !dbg !88
  %tobool1 = icmp ne i32 %and, 0, !dbg !88
  br i1 %tobool1, label %cond.true, label %cond.false, !dbg !88

cond.true:                                        ; preds = %if.then
  %call2 = call i32 @rand(), !dbg !88
  %shl = shl i32 %call2, 30, !dbg !88
  %call3 = call i32 @rand(), !dbg !88
  %shl4 = shl i32 %call3, 15, !dbg !88
  %xor = xor i32 %shl, %shl4, !dbg !88
  %call5 = call i32 @rand(), !dbg !88
  %xor6 = xor i32 %xor, %call5, !dbg !88
  br label %cond.end, !dbg !88

cond.false:                                       ; preds = %if.then
  %call7 = call i32 @rand(), !dbg !88
  %shl8 = shl i32 %call7, 30, !dbg !88
  %call9 = call i32 @rand(), !dbg !88
  %shl10 = shl i32 %call9, 15, !dbg !88
  %xor11 = xor i32 %shl8, %shl10, !dbg !88
  %call12 = call i32 @rand(), !dbg !88
  %xor13 = xor i32 %xor11, %call12, !dbg !88
  %sub = sub i32 0, %xor13, !dbg !88
  %sub14 = sub i32 %sub, 1, !dbg !88
  br label %cond.end, !dbg !88

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor6, %cond.true ], [ %sub14, %cond.false ], !dbg !88
  store i32 %cond, i32* %data, align 4, !dbg !90
  br label %if.end, !dbg !91

if.end:                                           ; preds = %cond.end, %entry
  %1 = load i32, i32* @staticFalse, align 4, !dbg !92
  %tobool15 = icmp ne i32 %1, 0, !dbg !92
  br i1 %tobool15, label %if.then16, label %if.else, !dbg !94

if.then16:                                        ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !95
  br label %if.end21, !dbg !97

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !98, metadata !DIExpression()), !dbg !101
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !101
  %3 = load i32, i32* %data, align 4, !dbg !102
  %cmp = icmp sge i32 %3, 0, !dbg !104
  br i1 %cmp, label %land.lhs.true, label %if.else19, !dbg !105

land.lhs.true:                                    ; preds = %if.else
  %4 = load i32, i32* %data, align 4, !dbg !106
  %cmp17 = icmp slt i32 %4, 10, !dbg !107
  br i1 %cmp17, label %if.then18, label %if.else19, !dbg !108

if.then18:                                        ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !109
  %idxprom = sext i32 %5 to i64, !dbg !111
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !111
  %6 = load i32, i32* %arrayidx, align 4, !dbg !111
  call void @printIntLine(i32 noundef %6), !dbg !112
  br label %if.end20, !dbg !113

if.else19:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !114
  br label %if.end20

if.end20:                                         ; preds = %if.else19, %if.then18
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %if.then16
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !117 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !118, metadata !DIExpression()), !dbg !119
  store i32 -1, i32* %data, align 4, !dbg !120
  %0 = load i32, i32* @staticTrue, align 4, !dbg !121
  %tobool = icmp ne i32 %0, 0, !dbg !121
  br i1 %tobool, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %entry
  %call = call i32 @rand(), !dbg !124
  %and = and i32 %call, 1, !dbg !124
  %tobool1 = icmp ne i32 %and, 0, !dbg !124
  br i1 %tobool1, label %cond.true, label %cond.false, !dbg !124

cond.true:                                        ; preds = %if.then
  %call2 = call i32 @rand(), !dbg !124
  %shl = shl i32 %call2, 30, !dbg !124
  %call3 = call i32 @rand(), !dbg !124
  %shl4 = shl i32 %call3, 15, !dbg !124
  %xor = xor i32 %shl, %shl4, !dbg !124
  %call5 = call i32 @rand(), !dbg !124
  %xor6 = xor i32 %xor, %call5, !dbg !124
  br label %cond.end, !dbg !124

cond.false:                                       ; preds = %if.then
  %call7 = call i32 @rand(), !dbg !124
  %shl8 = shl i32 %call7, 30, !dbg !124
  %call9 = call i32 @rand(), !dbg !124
  %shl10 = shl i32 %call9, 15, !dbg !124
  %xor11 = xor i32 %shl8, %shl10, !dbg !124
  %call12 = call i32 @rand(), !dbg !124
  %xor13 = xor i32 %xor11, %call12, !dbg !124
  %sub = sub i32 0, %xor13, !dbg !124
  %sub14 = sub i32 %sub, 1, !dbg !124
  br label %cond.end, !dbg !124

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor6, %cond.true ], [ %sub14, %cond.false ], !dbg !124
  store i32 %cond, i32* %data, align 4, !dbg !126
  br label %if.end, !dbg !127

if.end:                                           ; preds = %cond.end, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !128
  %tobool15 = icmp ne i32 %1, 0, !dbg !128
  br i1 %tobool15, label %if.then16, label %if.end20, !dbg !130

if.then16:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !131, metadata !DIExpression()), !dbg !134
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !134
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !134
  %3 = load i32, i32* %data, align 4, !dbg !135
  %cmp = icmp sge i32 %3, 0, !dbg !137
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !138

land.lhs.true:                                    ; preds = %if.then16
  %4 = load i32, i32* %data, align 4, !dbg !139
  %cmp17 = icmp slt i32 %4, 10, !dbg !140
  br i1 %cmp17, label %if.then18, label %if.else, !dbg !141

if.then18:                                        ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !142
  %idxprom = sext i32 %5 to i64, !dbg !144
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !144
  %6 = load i32, i32* %arrayidx, align 4, !dbg !144
  call void @printIntLine(i32 noundef %6), !dbg !145
  br label %if.end19, !dbg !146

if.else:                                          ; preds = %land.lhs.true, %if.then16
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !147
  br label %if.end19

if.end19:                                         ; preds = %if.else, %if.then18
  br label %if.end20, !dbg !149

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !150
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !151 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !152, metadata !DIExpression()), !dbg !153
  store i32 -1, i32* %data, align 4, !dbg !154
  %0 = load i32, i32* @staticFalse, align 4, !dbg !155
  %tobool = icmp ne i32 %0, 0, !dbg !155
  br i1 %tobool, label %if.then, label %if.else, !dbg !157

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !158
  br label %if.end, !dbg !160

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !161
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticTrue, align 4, !dbg !163
  %tobool1 = icmp ne i32 %1, 0, !dbg !163
  br i1 %tobool1, label %if.then2, label %if.end6, !dbg !165

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !166, metadata !DIExpression()), !dbg !169
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !169
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !169
  %3 = load i32, i32* %data, align 4, !dbg !170
  %cmp = icmp sge i32 %3, 0, !dbg !172
  br i1 %cmp, label %if.then3, label %if.else4, !dbg !173

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !174
  %idxprom = sext i32 %4 to i64, !dbg !176
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !176
  %5 = load i32, i32* %arrayidx, align 4, !dbg !176
  call void @printIntLine(i32 noundef %5), !dbg !177
  br label %if.end5, !dbg !178

if.else4:                                         ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !179
  br label %if.end5

if.end5:                                          ; preds = %if.else4, %if.then3
  br label %if.end6, !dbg !181

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !182
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !183 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !184, metadata !DIExpression()), !dbg !185
  store i32 -1, i32* %data, align 4, !dbg !186
  %0 = load i32, i32* @staticTrue, align 4, !dbg !187
  %tobool = icmp ne i32 %0, 0, !dbg !187
  br i1 %tobool, label %if.then, label %if.end, !dbg !189

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !190
  br label %if.end, !dbg !192

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !193
  %tobool1 = icmp ne i32 %1, 0, !dbg !193
  br i1 %tobool1, label %if.then2, label %if.end5, !dbg !195

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !196, metadata !DIExpression()), !dbg !199
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !199
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !199
  %3 = load i32, i32* %data, align 4, !dbg !200
  %cmp = icmp sge i32 %3, 0, !dbg !202
  br i1 %cmp, label %if.then3, label %if.else, !dbg !203

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !204
  %idxprom = sext i32 %4 to i64, !dbg !206
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !206
  %5 = load i32, i32* %arrayidx, align 4, !dbg !206
  call void @printIntLine(i32 noundef %5), !dbg !207
  br label %if.end4, !dbg !208

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !209
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then3
  br label %if.end5, !dbg !211

if.end5:                                          ; preds = %if.end4, %if.end
  ret void, !dbg !212
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 23, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !7, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !6}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 24, type: !5, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_05_bad", scope: !10, file: !10, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 30, type: !5)
!23 = !DILocation(line: 30, column: 9, scope: !18)
!24 = !DILocation(line: 32, column: 10, scope: !18)
!25 = !DILocation(line: 33, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !18, file: !10, line: 33, column: 8)
!27 = !DILocation(line: 33, column: 8, scope: !18)
!28 = !DILocation(line: 36, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !10, line: 34, column: 5)
!30 = !DILocation(line: 36, column: 14, scope: !29)
!31 = !DILocation(line: 37, column: 5, scope: !29)
!32 = !DILocation(line: 38, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !18, file: !10, line: 38, column: 8)
!34 = !DILocation(line: 38, column: 8, scope: !18)
!35 = !DILocalVariable(name: "buffer", scope: !36, file: !10, line: 41, type: !38)
!36 = distinct !DILexicalBlock(scope: !37, file: !10, line: 40, column: 9)
!37 = distinct !DILexicalBlock(scope: !33, file: !10, line: 39, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 10)
!41 = !DILocation(line: 41, column: 17, scope: !36)
!42 = !DILocation(line: 44, column: 17, scope: !43)
!43 = distinct !DILexicalBlock(scope: !36, file: !10, line: 44, column: 17)
!44 = !DILocation(line: 44, column: 22, scope: !43)
!45 = !DILocation(line: 44, column: 17, scope: !36)
!46 = !DILocation(line: 46, column: 37, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !10, line: 45, column: 13)
!48 = !DILocation(line: 46, column: 30, scope: !47)
!49 = !DILocation(line: 46, column: 17, scope: !47)
!50 = !DILocation(line: 47, column: 13, scope: !47)
!51 = !DILocation(line: 50, column: 17, scope: !52)
!52 = distinct !DILexicalBlock(scope: !43, file: !10, line: 49, column: 13)
!53 = !DILocation(line: 53, column: 5, scope: !37)
!54 = !DILocation(line: 54, column: 1, scope: !18)
!55 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_05_good", scope: !10, file: !10, line: 186, type: !19, scopeLine: 187, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!56 = !DILocation(line: 188, column: 5, scope: !55)
!57 = !DILocation(line: 189, column: 5, scope: !55)
!58 = !DILocation(line: 190, column: 5, scope: !55)
!59 = !DILocation(line: 191, column: 5, scope: !55)
!60 = !DILocation(line: 192, column: 1, scope: !55)
!61 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 203, type: !62, scopeLine: 204, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!62 = !DISubroutineType(types: !63)
!63 = !{!5, !5, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !10, line: 203, type: !5)
!68 = !DILocation(line: 203, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !10, line: 203, type: !64)
!70 = !DILocation(line: 203, column: 27, scope: !61)
!71 = !DILocation(line: 206, column: 22, scope: !61)
!72 = !DILocation(line: 206, column: 12, scope: !61)
!73 = !DILocation(line: 206, column: 5, scope: !61)
!74 = !DILocation(line: 208, column: 5, scope: !61)
!75 = !DILocation(line: 209, column: 5, scope: !61)
!76 = !DILocation(line: 210, column: 5, scope: !61)
!77 = !DILocation(line: 213, column: 5, scope: !61)
!78 = !DILocation(line: 214, column: 5, scope: !61)
!79 = !DILocation(line: 215, column: 5, scope: !61)
!80 = !DILocation(line: 217, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodB2G1", scope: !10, file: !10, line: 61, type: !19, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!82 = !DILocalVariable(name: "data", scope: !81, file: !10, line: 63, type: !5)
!83 = !DILocation(line: 63, column: 9, scope: !81)
!84 = !DILocation(line: 65, column: 10, scope: !81)
!85 = !DILocation(line: 66, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !10, line: 66, column: 8)
!87 = !DILocation(line: 66, column: 8, scope: !81)
!88 = !DILocation(line: 69, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !10, line: 67, column: 5)
!90 = !DILocation(line: 69, column: 14, scope: !89)
!91 = !DILocation(line: 70, column: 5, scope: !89)
!92 = !DILocation(line: 71, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !81, file: !10, line: 71, column: 8)
!94 = !DILocation(line: 71, column: 8, scope: !81)
!95 = !DILocation(line: 74, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !10, line: 72, column: 5)
!97 = !DILocation(line: 75, column: 5, scope: !96)
!98 = !DILocalVariable(name: "buffer", scope: !99, file: !10, line: 79, type: !38)
!99 = distinct !DILexicalBlock(scope: !100, file: !10, line: 78, column: 9)
!100 = distinct !DILexicalBlock(scope: !93, file: !10, line: 77, column: 5)
!101 = !DILocation(line: 79, column: 17, scope: !99)
!102 = !DILocation(line: 81, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !10, line: 81, column: 17)
!104 = !DILocation(line: 81, column: 22, scope: !103)
!105 = !DILocation(line: 81, column: 27, scope: !103)
!106 = !DILocation(line: 81, column: 30, scope: !103)
!107 = !DILocation(line: 81, column: 35, scope: !103)
!108 = !DILocation(line: 81, column: 17, scope: !99)
!109 = !DILocation(line: 83, column: 37, scope: !110)
!110 = distinct !DILexicalBlock(scope: !103, file: !10, line: 82, column: 13)
!111 = !DILocation(line: 83, column: 30, scope: !110)
!112 = !DILocation(line: 83, column: 17, scope: !110)
!113 = !DILocation(line: 84, column: 13, scope: !110)
!114 = !DILocation(line: 87, column: 17, scope: !115)
!115 = distinct !DILexicalBlock(scope: !103, file: !10, line: 86, column: 13)
!116 = !DILocation(line: 91, column: 1, scope: !81)
!117 = distinct !DISubprogram(name: "goodB2G2", scope: !10, file: !10, line: 94, type: !19, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!118 = !DILocalVariable(name: "data", scope: !117, file: !10, line: 96, type: !5)
!119 = !DILocation(line: 96, column: 9, scope: !117)
!120 = !DILocation(line: 98, column: 10, scope: !117)
!121 = !DILocation(line: 99, column: 8, scope: !122)
!122 = distinct !DILexicalBlock(scope: !117, file: !10, line: 99, column: 8)
!123 = !DILocation(line: 99, column: 8, scope: !117)
!124 = !DILocation(line: 102, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !10, line: 100, column: 5)
!126 = !DILocation(line: 102, column: 14, scope: !125)
!127 = !DILocation(line: 103, column: 5, scope: !125)
!128 = !DILocation(line: 104, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !117, file: !10, line: 104, column: 8)
!130 = !DILocation(line: 104, column: 8, scope: !117)
!131 = !DILocalVariable(name: "buffer", scope: !132, file: !10, line: 107, type: !38)
!132 = distinct !DILexicalBlock(scope: !133, file: !10, line: 106, column: 9)
!133 = distinct !DILexicalBlock(scope: !129, file: !10, line: 105, column: 5)
!134 = !DILocation(line: 107, column: 17, scope: !132)
!135 = !DILocation(line: 109, column: 17, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !10, line: 109, column: 17)
!137 = !DILocation(line: 109, column: 22, scope: !136)
!138 = !DILocation(line: 109, column: 27, scope: !136)
!139 = !DILocation(line: 109, column: 30, scope: !136)
!140 = !DILocation(line: 109, column: 35, scope: !136)
!141 = !DILocation(line: 109, column: 17, scope: !132)
!142 = !DILocation(line: 111, column: 37, scope: !143)
!143 = distinct !DILexicalBlock(scope: !136, file: !10, line: 110, column: 13)
!144 = !DILocation(line: 111, column: 30, scope: !143)
!145 = !DILocation(line: 111, column: 17, scope: !143)
!146 = !DILocation(line: 112, column: 13, scope: !143)
!147 = !DILocation(line: 115, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !136, file: !10, line: 114, column: 13)
!149 = !DILocation(line: 118, column: 5, scope: !133)
!150 = !DILocation(line: 119, column: 1, scope: !117)
!151 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 122, type: !19, scopeLine: 123, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!152 = !DILocalVariable(name: "data", scope: !151, file: !10, line: 124, type: !5)
!153 = !DILocation(line: 124, column: 9, scope: !151)
!154 = !DILocation(line: 126, column: 10, scope: !151)
!155 = !DILocation(line: 127, column: 8, scope: !156)
!156 = distinct !DILexicalBlock(scope: !151, file: !10, line: 127, column: 8)
!157 = !DILocation(line: 127, column: 8, scope: !151)
!158 = !DILocation(line: 130, column: 9, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !10, line: 128, column: 5)
!160 = !DILocation(line: 131, column: 5, scope: !159)
!161 = !DILocation(line: 136, column: 14, scope: !162)
!162 = distinct !DILexicalBlock(scope: !156, file: !10, line: 133, column: 5)
!163 = !DILocation(line: 138, column: 8, scope: !164)
!164 = distinct !DILexicalBlock(scope: !151, file: !10, line: 138, column: 8)
!165 = !DILocation(line: 138, column: 8, scope: !151)
!166 = !DILocalVariable(name: "buffer", scope: !167, file: !10, line: 141, type: !38)
!167 = distinct !DILexicalBlock(scope: !168, file: !10, line: 140, column: 9)
!168 = distinct !DILexicalBlock(scope: !164, file: !10, line: 139, column: 5)
!169 = !DILocation(line: 141, column: 17, scope: !167)
!170 = !DILocation(line: 144, column: 17, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !10, line: 144, column: 17)
!172 = !DILocation(line: 144, column: 22, scope: !171)
!173 = !DILocation(line: 144, column: 17, scope: !167)
!174 = !DILocation(line: 146, column: 37, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !10, line: 145, column: 13)
!176 = !DILocation(line: 146, column: 30, scope: !175)
!177 = !DILocation(line: 146, column: 17, scope: !175)
!178 = !DILocation(line: 147, column: 13, scope: !175)
!179 = !DILocation(line: 150, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !171, file: !10, line: 149, column: 13)
!181 = !DILocation(line: 153, column: 5, scope: !168)
!182 = !DILocation(line: 154, column: 1, scope: !151)
!183 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 157, type: !19, scopeLine: 158, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!184 = !DILocalVariable(name: "data", scope: !183, file: !10, line: 159, type: !5)
!185 = !DILocation(line: 159, column: 9, scope: !183)
!186 = !DILocation(line: 161, column: 10, scope: !183)
!187 = !DILocation(line: 162, column: 8, scope: !188)
!188 = distinct !DILexicalBlock(scope: !183, file: !10, line: 162, column: 8)
!189 = !DILocation(line: 162, column: 8, scope: !183)
!190 = !DILocation(line: 166, column: 14, scope: !191)
!191 = distinct !DILexicalBlock(scope: !188, file: !10, line: 163, column: 5)
!192 = !DILocation(line: 167, column: 5, scope: !191)
!193 = !DILocation(line: 168, column: 8, scope: !194)
!194 = distinct !DILexicalBlock(scope: !183, file: !10, line: 168, column: 8)
!195 = !DILocation(line: 168, column: 8, scope: !183)
!196 = !DILocalVariable(name: "buffer", scope: !197, file: !10, line: 171, type: !38)
!197 = distinct !DILexicalBlock(scope: !198, file: !10, line: 170, column: 9)
!198 = distinct !DILexicalBlock(scope: !194, file: !10, line: 169, column: 5)
!199 = !DILocation(line: 171, column: 17, scope: !197)
!200 = !DILocation(line: 174, column: 17, scope: !201)
!201 = distinct !DILexicalBlock(scope: !197, file: !10, line: 174, column: 17)
!202 = !DILocation(line: 174, column: 22, scope: !201)
!203 = !DILocation(line: 174, column: 17, scope: !197)
!204 = !DILocation(line: 176, column: 37, scope: !205)
!205 = distinct !DILexicalBlock(scope: !201, file: !10, line: 175, column: 13)
!206 = !DILocation(line: 176, column: 30, scope: !205)
!207 = !DILocation(line: 176, column: 17, scope: !205)
!208 = !DILocation(line: 177, column: 13, scope: !205)
!209 = !DILocation(line: 180, column: 17, scope: !210)
!210 = distinct !DILexicalBlock(scope: !201, file: !10, line: 179, column: 13)
!211 = !DILocation(line: 183, column: 5, scope: !198)
!212 = !DILocation(line: 184, column: 1, scope: !183)
