; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_rand_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 -1, i32* %data, align 4, !dbg !22
  %0 = load i32, i32* @staticFive, align 4, !dbg !23
  %cmp = icmp eq i32 %0, 5, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  %call = call i32 @rand(), !dbg !27
  %and = and i32 %call, 1, !dbg !27
  %tobool = icmp ne i32 %and, 0, !dbg !27
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !27

cond.true:                                        ; preds = %if.then
  %call1 = call i32 @rand(), !dbg !27
  %shl = shl i32 %call1, 30, !dbg !27
  %call2 = call i32 @rand(), !dbg !27
  %shl3 = shl i32 %call2, 15, !dbg !27
  %xor = xor i32 %shl, %shl3, !dbg !27
  %call4 = call i32 @rand(), !dbg !27
  %xor5 = xor i32 %xor, %call4, !dbg !27
  br label %cond.end, !dbg !27

cond.false:                                       ; preds = %if.then
  %call6 = call i32 @rand(), !dbg !27
  %shl7 = shl i32 %call6, 30, !dbg !27
  %call8 = call i32 @rand(), !dbg !27
  %shl9 = shl i32 %call8, 15, !dbg !27
  %xor10 = xor i32 %shl7, %shl9, !dbg !27
  %call11 = call i32 @rand(), !dbg !27
  %xor12 = xor i32 %xor10, %call11, !dbg !27
  %sub = sub i32 0, %xor12, !dbg !27
  %sub13 = sub i32 %sub, 1, !dbg !27
  br label %cond.end, !dbg !27

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !27
  store i32 %cond, i32* %data, align 4, !dbg !29
  br label %if.end, !dbg !30

if.end:                                           ; preds = %cond.end, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !31
  %cmp14 = icmp eq i32 %1, 5, !dbg !33
  br i1 %cmp14, label %if.then15, label %if.end19, !dbg !34

if.then15:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !35, metadata !DIExpression()), !dbg !41
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !41
  %3 = load i32, i32* %data, align 4, !dbg !42
  %cmp16 = icmp sge i32 %3, 0, !dbg !44
  br i1 %cmp16, label %if.then17, label %if.else, !dbg !45

if.then17:                                        ; preds = %if.then15
  %4 = load i32, i32* %data, align 4, !dbg !46
  %idxprom = sext i32 %4 to i64, !dbg !48
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !48
  %5 = load i32, i32* %arrayidx, align 4, !dbg !48
  call void @printIntLine(i32 noundef %5), !dbg !49
  br label %if.end18, !dbg !50

if.else:                                          ; preds = %if.then15
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
define void @CWE126_Buffer_Overread__CWE129_rand_07_good() #0 !dbg !55 {
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
  call void @CWE126_Buffer_Overread__CWE129_rand_07_good(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  call void @CWE126_Buffer_Overread__CWE129_rand_07_bad(), !dbg !78
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
  %0 = load i32, i32* @staticFive, align 4, !dbg !85
  %cmp = icmp eq i32 %0, 5, !dbg !87
  br i1 %cmp, label %if.then, label %if.end, !dbg !88

if.then:                                          ; preds = %entry
  %call = call i32 @rand(), !dbg !89
  %and = and i32 %call, 1, !dbg !89
  %tobool = icmp ne i32 %and, 0, !dbg !89
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !89

cond.true:                                        ; preds = %if.then
  %call1 = call i32 @rand(), !dbg !89
  %shl = shl i32 %call1, 30, !dbg !89
  %call2 = call i32 @rand(), !dbg !89
  %shl3 = shl i32 %call2, 15, !dbg !89
  %xor = xor i32 %shl, %shl3, !dbg !89
  %call4 = call i32 @rand(), !dbg !89
  %xor5 = xor i32 %xor, %call4, !dbg !89
  br label %cond.end, !dbg !89

cond.false:                                       ; preds = %if.then
  %call6 = call i32 @rand(), !dbg !89
  %shl7 = shl i32 %call6, 30, !dbg !89
  %call8 = call i32 @rand(), !dbg !89
  %shl9 = shl i32 %call8, 15, !dbg !89
  %xor10 = xor i32 %shl7, %shl9, !dbg !89
  %call11 = call i32 @rand(), !dbg !89
  %xor12 = xor i32 %xor10, %call11, !dbg !89
  %sub = sub i32 0, %xor12, !dbg !89
  %sub13 = sub i32 %sub, 1, !dbg !89
  br label %cond.end, !dbg !89

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !89
  store i32 %cond, i32* %data, align 4, !dbg !91
  br label %if.end, !dbg !92

if.end:                                           ; preds = %cond.end, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !93
  %cmp14 = icmp ne i32 %1, 5, !dbg !95
  br i1 %cmp14, label %if.then15, label %if.else, !dbg !96

if.then15:                                        ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !97
  br label %if.end21, !dbg !99

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !100, metadata !DIExpression()), !dbg !103
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !103
  %3 = load i32, i32* %data, align 4, !dbg !104
  %cmp16 = icmp sge i32 %3, 0, !dbg !106
  br i1 %cmp16, label %land.lhs.true, label %if.else19, !dbg !107

land.lhs.true:                                    ; preds = %if.else
  %4 = load i32, i32* %data, align 4, !dbg !108
  %cmp17 = icmp slt i32 %4, 10, !dbg !109
  br i1 %cmp17, label %if.then18, label %if.else19, !dbg !110

if.then18:                                        ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !111
  %idxprom = sext i32 %5 to i64, !dbg !113
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !113
  %6 = load i32, i32* %arrayidx, align 4, !dbg !113
  call void @printIntLine(i32 noundef %6), !dbg !114
  br label %if.end20, !dbg !115

if.else19:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !116
  br label %if.end20

if.end20:                                         ; preds = %if.else19, %if.then18
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %if.then15
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !119 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !120, metadata !DIExpression()), !dbg !121
  store i32 -1, i32* %data, align 4, !dbg !122
  %0 = load i32, i32* @staticFive, align 4, !dbg !123
  %cmp = icmp eq i32 %0, 5, !dbg !125
  br i1 %cmp, label %if.then, label %if.end, !dbg !126

if.then:                                          ; preds = %entry
  %call = call i32 @rand(), !dbg !127
  %and = and i32 %call, 1, !dbg !127
  %tobool = icmp ne i32 %and, 0, !dbg !127
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !127

cond.true:                                        ; preds = %if.then
  %call1 = call i32 @rand(), !dbg !127
  %shl = shl i32 %call1, 30, !dbg !127
  %call2 = call i32 @rand(), !dbg !127
  %shl3 = shl i32 %call2, 15, !dbg !127
  %xor = xor i32 %shl, %shl3, !dbg !127
  %call4 = call i32 @rand(), !dbg !127
  %xor5 = xor i32 %xor, %call4, !dbg !127
  br label %cond.end, !dbg !127

cond.false:                                       ; preds = %if.then
  %call6 = call i32 @rand(), !dbg !127
  %shl7 = shl i32 %call6, 30, !dbg !127
  %call8 = call i32 @rand(), !dbg !127
  %shl9 = shl i32 %call8, 15, !dbg !127
  %xor10 = xor i32 %shl7, %shl9, !dbg !127
  %call11 = call i32 @rand(), !dbg !127
  %xor12 = xor i32 %xor10, %call11, !dbg !127
  %sub = sub i32 0, %xor12, !dbg !127
  %sub13 = sub i32 %sub, 1, !dbg !127
  br label %cond.end, !dbg !127

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !127
  store i32 %cond, i32* %data, align 4, !dbg !129
  br label %if.end, !dbg !130

if.end:                                           ; preds = %cond.end, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !131
  %cmp14 = icmp eq i32 %1, 5, !dbg !133
  br i1 %cmp14, label %if.then15, label %if.end20, !dbg !134

if.then15:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !135, metadata !DIExpression()), !dbg !138
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !138
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !138
  %3 = load i32, i32* %data, align 4, !dbg !139
  %cmp16 = icmp sge i32 %3, 0, !dbg !141
  br i1 %cmp16, label %land.lhs.true, label %if.else, !dbg !142

land.lhs.true:                                    ; preds = %if.then15
  %4 = load i32, i32* %data, align 4, !dbg !143
  %cmp17 = icmp slt i32 %4, 10, !dbg !144
  br i1 %cmp17, label %if.then18, label %if.else, !dbg !145

if.then18:                                        ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !146
  %idxprom = sext i32 %5 to i64, !dbg !148
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !148
  %6 = load i32, i32* %arrayidx, align 4, !dbg !148
  call void @printIntLine(i32 noundef %6), !dbg !149
  br label %if.end19, !dbg !150

if.else:                                          ; preds = %land.lhs.true, %if.then15
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !151
  br label %if.end19

if.end19:                                         ; preds = %if.else, %if.then18
  br label %if.end20, !dbg !153

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !154
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !155 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !156, metadata !DIExpression()), !dbg !157
  store i32 -1, i32* %data, align 4, !dbg !158
  %0 = load i32, i32* @staticFive, align 4, !dbg !159
  %cmp = icmp ne i32 %0, 5, !dbg !161
  br i1 %cmp, label %if.then, label %if.else, !dbg !162

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !163
  br label %if.end, !dbg !165

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !166
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticFive, align 4, !dbg !168
  %cmp1 = icmp eq i32 %1, 5, !dbg !170
  br i1 %cmp1, label %if.then2, label %if.end7, !dbg !171

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !172, metadata !DIExpression()), !dbg !175
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !175
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !175
  %3 = load i32, i32* %data, align 4, !dbg !176
  %cmp3 = icmp sge i32 %3, 0, !dbg !178
  br i1 %cmp3, label %if.then4, label %if.else5, !dbg !179

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !180
  %idxprom = sext i32 %4 to i64, !dbg !182
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !182
  %5 = load i32, i32* %arrayidx, align 4, !dbg !182
  call void @printIntLine(i32 noundef %5), !dbg !183
  br label %if.end6, !dbg !184

if.else5:                                         ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !185
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7, !dbg !187

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !188
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !189 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !190, metadata !DIExpression()), !dbg !191
  store i32 -1, i32* %data, align 4, !dbg !192
  %0 = load i32, i32* @staticFive, align 4, !dbg !193
  %cmp = icmp eq i32 %0, 5, !dbg !195
  br i1 %cmp, label %if.then, label %if.end, !dbg !196

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !197
  br label %if.end, !dbg !199

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !200
  %cmp1 = icmp eq i32 %1, 5, !dbg !202
  br i1 %cmp1, label %if.then2, label %if.end6, !dbg !203

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !204, metadata !DIExpression()), !dbg !207
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !207
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !207
  %3 = load i32, i32* %data, align 4, !dbg !208
  %cmp3 = icmp sge i32 %3, 0, !dbg !210
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !211

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !212
  %idxprom = sext i32 %4 to i64, !dbg !214
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !214
  %5 = load i32, i32* %arrayidx, align 4, !dbg !214
  call void @printIntLine(i32 noundef %5), !dbg !215
  br label %if.end5, !dbg !216

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !217
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !219

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !220
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 23, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !7, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !6}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_rand_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"Homebrew clang version 14.0.6"}
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_07_bad", scope: !8, file: !8, line: 27, type: !17, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 29, type: !5)
!21 = !DILocation(line: 29, column: 9, scope: !16)
!22 = !DILocation(line: 31, column: 10, scope: !16)
!23 = !DILocation(line: 32, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !8, line: 32, column: 8)
!25 = !DILocation(line: 32, column: 18, scope: !24)
!26 = !DILocation(line: 32, column: 8, scope: !16)
!27 = !DILocation(line: 35, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !8, line: 33, column: 5)
!29 = !DILocation(line: 35, column: 14, scope: !28)
!30 = !DILocation(line: 36, column: 5, scope: !28)
!31 = !DILocation(line: 37, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !16, file: !8, line: 37, column: 8)
!33 = !DILocation(line: 37, column: 18, scope: !32)
!34 = !DILocation(line: 37, column: 8, scope: !16)
!35 = !DILocalVariable(name: "buffer", scope: !36, file: !8, line: 40, type: !38)
!36 = distinct !DILexicalBlock(scope: !37, file: !8, line: 39, column: 9)
!37 = distinct !DILexicalBlock(scope: !32, file: !8, line: 38, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 10)
!41 = !DILocation(line: 40, column: 17, scope: !36)
!42 = !DILocation(line: 43, column: 17, scope: !43)
!43 = distinct !DILexicalBlock(scope: !36, file: !8, line: 43, column: 17)
!44 = !DILocation(line: 43, column: 22, scope: !43)
!45 = !DILocation(line: 43, column: 17, scope: !36)
!46 = !DILocation(line: 45, column: 37, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !8, line: 44, column: 13)
!48 = !DILocation(line: 45, column: 30, scope: !47)
!49 = !DILocation(line: 45, column: 17, scope: !47)
!50 = !DILocation(line: 46, column: 13, scope: !47)
!51 = !DILocation(line: 49, column: 17, scope: !52)
!52 = distinct !DILexicalBlock(scope: !43, file: !8, line: 48, column: 13)
!53 = !DILocation(line: 52, column: 5, scope: !37)
!54 = !DILocation(line: 53, column: 1, scope: !16)
!55 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_07_good", scope: !8, file: !8, line: 185, type: !17, scopeLine: 186, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!56 = !DILocation(line: 187, column: 5, scope: !55)
!57 = !DILocation(line: 188, column: 5, scope: !55)
!58 = !DILocation(line: 189, column: 5, scope: !55)
!59 = !DILocation(line: 190, column: 5, scope: !55)
!60 = !DILocation(line: 191, column: 1, scope: !55)
!61 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 202, type: !62, scopeLine: 203, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!62 = !DISubroutineType(types: !63)
!63 = !{!5, !5, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !8, line: 202, type: !5)
!68 = !DILocation(line: 202, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !8, line: 202, type: !64)
!70 = !DILocation(line: 202, column: 27, scope: !61)
!71 = !DILocation(line: 205, column: 22, scope: !61)
!72 = !DILocation(line: 205, column: 12, scope: !61)
!73 = !DILocation(line: 205, column: 5, scope: !61)
!74 = !DILocation(line: 207, column: 5, scope: !61)
!75 = !DILocation(line: 208, column: 5, scope: !61)
!76 = !DILocation(line: 209, column: 5, scope: !61)
!77 = !DILocation(line: 212, column: 5, scope: !61)
!78 = !DILocation(line: 213, column: 5, scope: !61)
!79 = !DILocation(line: 214, column: 5, scope: !61)
!80 = !DILocation(line: 216, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodB2G1", scope: !8, file: !8, line: 60, type: !17, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!82 = !DILocalVariable(name: "data", scope: !81, file: !8, line: 62, type: !5)
!83 = !DILocation(line: 62, column: 9, scope: !81)
!84 = !DILocation(line: 64, column: 10, scope: !81)
!85 = !DILocation(line: 65, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !8, line: 65, column: 8)
!87 = !DILocation(line: 65, column: 18, scope: !86)
!88 = !DILocation(line: 65, column: 8, scope: !81)
!89 = !DILocation(line: 68, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !8, line: 66, column: 5)
!91 = !DILocation(line: 68, column: 14, scope: !90)
!92 = !DILocation(line: 69, column: 5, scope: !90)
!93 = !DILocation(line: 70, column: 8, scope: !94)
!94 = distinct !DILexicalBlock(scope: !81, file: !8, line: 70, column: 8)
!95 = !DILocation(line: 70, column: 18, scope: !94)
!96 = !DILocation(line: 70, column: 8, scope: !81)
!97 = !DILocation(line: 73, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !8, line: 71, column: 5)
!99 = !DILocation(line: 74, column: 5, scope: !98)
!100 = !DILocalVariable(name: "buffer", scope: !101, file: !8, line: 78, type: !38)
!101 = distinct !DILexicalBlock(scope: !102, file: !8, line: 77, column: 9)
!102 = distinct !DILexicalBlock(scope: !94, file: !8, line: 76, column: 5)
!103 = !DILocation(line: 78, column: 17, scope: !101)
!104 = !DILocation(line: 80, column: 17, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !8, line: 80, column: 17)
!106 = !DILocation(line: 80, column: 22, scope: !105)
!107 = !DILocation(line: 80, column: 27, scope: !105)
!108 = !DILocation(line: 80, column: 30, scope: !105)
!109 = !DILocation(line: 80, column: 35, scope: !105)
!110 = !DILocation(line: 80, column: 17, scope: !101)
!111 = !DILocation(line: 82, column: 37, scope: !112)
!112 = distinct !DILexicalBlock(scope: !105, file: !8, line: 81, column: 13)
!113 = !DILocation(line: 82, column: 30, scope: !112)
!114 = !DILocation(line: 82, column: 17, scope: !112)
!115 = !DILocation(line: 83, column: 13, scope: !112)
!116 = !DILocation(line: 86, column: 17, scope: !117)
!117 = distinct !DILexicalBlock(scope: !105, file: !8, line: 85, column: 13)
!118 = !DILocation(line: 90, column: 1, scope: !81)
!119 = distinct !DISubprogram(name: "goodB2G2", scope: !8, file: !8, line: 93, type: !17, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!120 = !DILocalVariable(name: "data", scope: !119, file: !8, line: 95, type: !5)
!121 = !DILocation(line: 95, column: 9, scope: !119)
!122 = !DILocation(line: 97, column: 10, scope: !119)
!123 = !DILocation(line: 98, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !119, file: !8, line: 98, column: 8)
!125 = !DILocation(line: 98, column: 18, scope: !124)
!126 = !DILocation(line: 98, column: 8, scope: !119)
!127 = !DILocation(line: 101, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !8, line: 99, column: 5)
!129 = !DILocation(line: 101, column: 14, scope: !128)
!130 = !DILocation(line: 102, column: 5, scope: !128)
!131 = !DILocation(line: 103, column: 8, scope: !132)
!132 = distinct !DILexicalBlock(scope: !119, file: !8, line: 103, column: 8)
!133 = !DILocation(line: 103, column: 18, scope: !132)
!134 = !DILocation(line: 103, column: 8, scope: !119)
!135 = !DILocalVariable(name: "buffer", scope: !136, file: !8, line: 106, type: !38)
!136 = distinct !DILexicalBlock(scope: !137, file: !8, line: 105, column: 9)
!137 = distinct !DILexicalBlock(scope: !132, file: !8, line: 104, column: 5)
!138 = !DILocation(line: 106, column: 17, scope: !136)
!139 = !DILocation(line: 108, column: 17, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !8, line: 108, column: 17)
!141 = !DILocation(line: 108, column: 22, scope: !140)
!142 = !DILocation(line: 108, column: 27, scope: !140)
!143 = !DILocation(line: 108, column: 30, scope: !140)
!144 = !DILocation(line: 108, column: 35, scope: !140)
!145 = !DILocation(line: 108, column: 17, scope: !136)
!146 = !DILocation(line: 110, column: 37, scope: !147)
!147 = distinct !DILexicalBlock(scope: !140, file: !8, line: 109, column: 13)
!148 = !DILocation(line: 110, column: 30, scope: !147)
!149 = !DILocation(line: 110, column: 17, scope: !147)
!150 = !DILocation(line: 111, column: 13, scope: !147)
!151 = !DILocation(line: 114, column: 17, scope: !152)
!152 = distinct !DILexicalBlock(scope: !140, file: !8, line: 113, column: 13)
!153 = !DILocation(line: 117, column: 5, scope: !137)
!154 = !DILocation(line: 118, column: 1, scope: !119)
!155 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 121, type: !17, scopeLine: 122, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!156 = !DILocalVariable(name: "data", scope: !155, file: !8, line: 123, type: !5)
!157 = !DILocation(line: 123, column: 9, scope: !155)
!158 = !DILocation(line: 125, column: 10, scope: !155)
!159 = !DILocation(line: 126, column: 8, scope: !160)
!160 = distinct !DILexicalBlock(scope: !155, file: !8, line: 126, column: 8)
!161 = !DILocation(line: 126, column: 18, scope: !160)
!162 = !DILocation(line: 126, column: 8, scope: !155)
!163 = !DILocation(line: 129, column: 9, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !8, line: 127, column: 5)
!165 = !DILocation(line: 130, column: 5, scope: !164)
!166 = !DILocation(line: 135, column: 14, scope: !167)
!167 = distinct !DILexicalBlock(scope: !160, file: !8, line: 132, column: 5)
!168 = !DILocation(line: 137, column: 8, scope: !169)
!169 = distinct !DILexicalBlock(scope: !155, file: !8, line: 137, column: 8)
!170 = !DILocation(line: 137, column: 18, scope: !169)
!171 = !DILocation(line: 137, column: 8, scope: !155)
!172 = !DILocalVariable(name: "buffer", scope: !173, file: !8, line: 140, type: !38)
!173 = distinct !DILexicalBlock(scope: !174, file: !8, line: 139, column: 9)
!174 = distinct !DILexicalBlock(scope: !169, file: !8, line: 138, column: 5)
!175 = !DILocation(line: 140, column: 17, scope: !173)
!176 = !DILocation(line: 143, column: 17, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !8, line: 143, column: 17)
!178 = !DILocation(line: 143, column: 22, scope: !177)
!179 = !DILocation(line: 143, column: 17, scope: !173)
!180 = !DILocation(line: 145, column: 37, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !8, line: 144, column: 13)
!182 = !DILocation(line: 145, column: 30, scope: !181)
!183 = !DILocation(line: 145, column: 17, scope: !181)
!184 = !DILocation(line: 146, column: 13, scope: !181)
!185 = !DILocation(line: 149, column: 17, scope: !186)
!186 = distinct !DILexicalBlock(scope: !177, file: !8, line: 148, column: 13)
!187 = !DILocation(line: 152, column: 5, scope: !174)
!188 = !DILocation(line: 153, column: 1, scope: !155)
!189 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 156, type: !17, scopeLine: 157, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!190 = !DILocalVariable(name: "data", scope: !189, file: !8, line: 158, type: !5)
!191 = !DILocation(line: 158, column: 9, scope: !189)
!192 = !DILocation(line: 160, column: 10, scope: !189)
!193 = !DILocation(line: 161, column: 8, scope: !194)
!194 = distinct !DILexicalBlock(scope: !189, file: !8, line: 161, column: 8)
!195 = !DILocation(line: 161, column: 18, scope: !194)
!196 = !DILocation(line: 161, column: 8, scope: !189)
!197 = !DILocation(line: 165, column: 14, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !8, line: 162, column: 5)
!199 = !DILocation(line: 166, column: 5, scope: !198)
!200 = !DILocation(line: 167, column: 8, scope: !201)
!201 = distinct !DILexicalBlock(scope: !189, file: !8, line: 167, column: 8)
!202 = !DILocation(line: 167, column: 18, scope: !201)
!203 = !DILocation(line: 167, column: 8, scope: !189)
!204 = !DILocalVariable(name: "buffer", scope: !205, file: !8, line: 170, type: !38)
!205 = distinct !DILexicalBlock(scope: !206, file: !8, line: 169, column: 9)
!206 = distinct !DILexicalBlock(scope: !201, file: !8, line: 168, column: 5)
!207 = !DILocation(line: 170, column: 17, scope: !205)
!208 = !DILocation(line: 173, column: 17, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !8, line: 173, column: 17)
!210 = !DILocation(line: 173, column: 22, scope: !209)
!211 = !DILocation(line: 173, column: 17, scope: !205)
!212 = !DILocation(line: 175, column: 37, scope: !213)
!213 = distinct !DILexicalBlock(scope: !209, file: !8, line: 174, column: 13)
!214 = !DILocation(line: 175, column: 30, scope: !213)
!215 = !DILocation(line: 175, column: 17, scope: !213)
!216 = !DILocation(line: 176, column: 13, scope: !213)
!217 = !DILocation(line: 179, column: 17, scope: !218)
!218 = distinct !DILexicalBlock(scope: !209, file: !8, line: 178, column: 13)
!219 = !DILocation(line: 182, column: 5, scope: !206)
!220 = !DILocation(line: 183, column: 1, scope: !189)
