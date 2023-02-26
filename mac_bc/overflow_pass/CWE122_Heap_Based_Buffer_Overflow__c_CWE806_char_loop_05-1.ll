; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !10
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !25, metadata !DIExpression()), !dbg !26
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !27
  store i8* %call, i8** %data, align 8, !dbg !28
  %0 = load i8*, i8** %data, align 8, !dbg !29
  %cmp = icmp eq i8* %0, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !35
  %tobool = icmp ne i32 %1, 0, !dbg !35
  br i1 %tobool, label %if.then1, label %if.end3, !dbg !37

if.then1:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !38
  %3 = load i8*, i8** %data, align 8, !dbg !38
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !38
  %call2 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 99, i64 noundef %4) #9, !dbg !38
  %5 = load i8*, i8** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 99, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  br label %if.end3, !dbg !42

if.end3:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !43, metadata !DIExpression()), !dbg !48
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !56, metadata !DIExpression()), !dbg !57
  %7 = load i8*, i8** %data, align 8, !dbg !58
  %call4 = call i64 @strlen(i8* noundef %7), !dbg !59
  store i64 %call4, i64* %dataLen, align 8, !dbg !60
  store i64 0, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.inc, %if.end3
  %8 = load i64, i64* %i, align 8, !dbg !64
  %9 = load i64, i64* %dataLen, align 8, !dbg !66
  %cmp5 = icmp ult i64 %8, %9, !dbg !67
  br i1 %cmp5, label %for.body, label %for.end, !dbg !68

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !69
  %11 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx6 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !69
  %12 = load i8, i8* %arrayidx6, align 1, !dbg !69
  %13 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %13, !dbg !73
  store i8 %12, i8* %arrayidx7, align 1, !dbg !74
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !76
  %inc = add i64 %14, 1, !dbg !76
  store i64 %inc, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !81
  store i8 0, i8* %arrayidx8, align 1, !dbg !82
  %15 = load i8*, i8** %data, align 8, !dbg !83
  call void @printLine(i8* noundef %15), !dbg !84
  %16 = load i8*, i8** %data, align 8, !dbg !85
  call void @free(i8* noundef %16), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

declare i64 @strlen(i8* noundef) #6

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_05_good() #0 !dbg !88 {
entry:
  call void @goodG2B1(), !dbg !89
  call void @goodG2B2(), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !92 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call i64 @time(i64* noundef null), !dbg !100
  %conv = trunc i64 %call to i32, !dbg !101
  call void @srand(i32 noundef %conv), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !103
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_05_good(), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_05_bad(), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  ret i32 0, !dbg !109
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !110 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !111, metadata !DIExpression()), !dbg !112
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !113
  store i8* %call, i8** %data, align 8, !dbg !114
  %0 = load i8*, i8** %data, align 8, !dbg !115
  %cmp = icmp eq i8* %0, null, !dbg !117
  br i1 %cmp, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !119
  unreachable, !dbg !119

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticFalse, align 4, !dbg !121
  %tobool = icmp ne i32 %1, 0, !dbg !121
  br i1 %tobool, label %if.then1, label %if.else, !dbg !123

if.then1:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !124
  br label %if.end3, !dbg !126

if.else:                                          ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !127
  %3 = load i8*, i8** %data, align 8, !dbg !127
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !127
  %call2 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #9, !dbg !127
  %5 = load i8*, i8** %data, align 8, !dbg !129
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !129
  store i8 0, i8* %arrayidx, align 1, !dbg !130
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then1
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !131, metadata !DIExpression()), !dbg !133
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !133
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !133
  call void @llvm.dbg.declare(metadata i64* %i, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !136, metadata !DIExpression()), !dbg !137
  %7 = load i8*, i8** %data, align 8, !dbg !138
  %call4 = call i64 @strlen(i8* noundef %7), !dbg !139
  store i64 %call4, i64* %dataLen, align 8, !dbg !140
  store i64 0, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !143

for.cond:                                         ; preds = %for.inc, %if.end3
  %8 = load i64, i64* %i, align 8, !dbg !144
  %9 = load i64, i64* %dataLen, align 8, !dbg !146
  %cmp5 = icmp ult i64 %8, %9, !dbg !147
  br i1 %cmp5, label %for.body, label %for.end, !dbg !148

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !149
  %11 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx6 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !149
  %12 = load i8, i8* %arrayidx6, align 1, !dbg !149
  %13 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %13, !dbg !153
  store i8 %12, i8* %arrayidx7, align 1, !dbg !154
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !156
  %inc = add i64 %14, 1, !dbg !156
  store i64 %inc, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !160
  store i8 0, i8* %arrayidx8, align 1, !dbg !161
  %15 = load i8*, i8** %data, align 8, !dbg !162
  call void @printLine(i8* noundef %15), !dbg !163
  %16 = load i8*, i8** %data, align 8, !dbg !164
  call void @free(i8* noundef %16), !dbg !165
  ret void, !dbg !166
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !167 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !168, metadata !DIExpression()), !dbg !169
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !170
  store i8* %call, i8** %data, align 8, !dbg !171
  %0 = load i8*, i8** %data, align 8, !dbg !172
  %cmp = icmp eq i8* %0, null, !dbg !174
  br i1 %cmp, label %if.then, label %if.end, !dbg !175

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !176
  unreachable, !dbg !176

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !178
  %tobool = icmp ne i32 %1, 0, !dbg !178
  br i1 %tobool, label %if.then1, label %if.end3, !dbg !180

if.then1:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !181
  %3 = load i8*, i8** %data, align 8, !dbg !181
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !181
  %call2 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #9, !dbg !181
  %5 = load i8*, i8** %data, align 8, !dbg !183
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !183
  store i8 0, i8* %arrayidx, align 1, !dbg !184
  br label %if.end3, !dbg !185

if.end3:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !186, metadata !DIExpression()), !dbg !188
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !188
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !188
  call void @llvm.dbg.declare(metadata i64* %i, metadata !189, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !191, metadata !DIExpression()), !dbg !192
  %7 = load i8*, i8** %data, align 8, !dbg !193
  %call4 = call i64 @strlen(i8* noundef %7), !dbg !194
  store i64 %call4, i64* %dataLen, align 8, !dbg !195
  store i64 0, i64* %i, align 8, !dbg !196
  br label %for.cond, !dbg !198

for.cond:                                         ; preds = %for.inc, %if.end3
  %8 = load i64, i64* %i, align 8, !dbg !199
  %9 = load i64, i64* %dataLen, align 8, !dbg !201
  %cmp5 = icmp ult i64 %8, %9, !dbg !202
  br i1 %cmp5, label %for.body, label %for.end, !dbg !203

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !204
  %11 = load i64, i64* %i, align 8, !dbg !206
  %arrayidx6 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !204
  %12 = load i8, i8* %arrayidx6, align 1, !dbg !204
  %13 = load i64, i64* %i, align 8, !dbg !207
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %13, !dbg !208
  store i8 %12, i8* %arrayidx7, align 1, !dbg !209
  br label %for.inc, !dbg !210

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !211
  %inc = add i64 %14, 1, !dbg !211
  store i64 %inc, i64* %i, align 8, !dbg !211
  br label %for.cond, !dbg !212, !llvm.loop !213

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !215
  store i8 0, i8* %arrayidx8, align 1, !dbg !216
  %15 = load i8*, i8** %data, align 8, !dbg !217
  call void @printLine(i8* noundef %15), !dbg !218
  %16 = load i8*, i8** %data, align 8, !dbg !219
  call void @free(i8* noundef %16), !dbg !220
  ret void, !dbg !221
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !12, line: 25, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !9, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7, !8}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !12, line: 26, type: !13, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"PIC Level", i32 2}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"Homebrew clang version 14.0.6"}
!21 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_05_bad", scope: !12, file: !12, line: 30, type: !22, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !{}
!25 = !DILocalVariable(name: "data", scope: !21, file: !12, line: 32, type: !5)
!26 = !DILocation(line: 32, column: 12, scope: !21)
!27 = !DILocation(line: 33, column: 20, scope: !21)
!28 = !DILocation(line: 33, column: 10, scope: !21)
!29 = !DILocation(line: 34, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !21, file: !12, line: 34, column: 9)
!31 = !DILocation(line: 34, column: 14, scope: !30)
!32 = !DILocation(line: 34, column: 9, scope: !21)
!33 = !DILocation(line: 34, column: 24, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !12, line: 34, column: 23)
!35 = !DILocation(line: 35, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !21, file: !12, line: 35, column: 8)
!37 = !DILocation(line: 35, column: 8, scope: !21)
!38 = !DILocation(line: 38, column: 9, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !12, line: 36, column: 5)
!40 = !DILocation(line: 39, column: 9, scope: !39)
!41 = !DILocation(line: 39, column: 21, scope: !39)
!42 = !DILocation(line: 40, column: 5, scope: !39)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !12, line: 42, type: !45)
!44 = distinct !DILexicalBlock(scope: !21, file: !12, line: 41, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 400, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 50)
!48 = !DILocation(line: 42, column: 14, scope: !44)
!49 = !DILocalVariable(name: "i", scope: !44, file: !12, line: 43, type: !50)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !51, line: 31, baseType: !52)
!51 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !53, line: 94, baseType: !54)
!53 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!54 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 43, column: 16, scope: !44)
!56 = !DILocalVariable(name: "dataLen", scope: !44, file: !12, line: 43, type: !50)
!57 = !DILocation(line: 43, column: 19, scope: !44)
!58 = !DILocation(line: 44, column: 26, scope: !44)
!59 = !DILocation(line: 44, column: 19, scope: !44)
!60 = !DILocation(line: 44, column: 17, scope: !44)
!61 = !DILocation(line: 46, column: 16, scope: !62)
!62 = distinct !DILexicalBlock(scope: !44, file: !12, line: 46, column: 9)
!63 = !DILocation(line: 46, column: 14, scope: !62)
!64 = !DILocation(line: 46, column: 21, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !12, line: 46, column: 9)
!66 = !DILocation(line: 46, column: 25, scope: !65)
!67 = !DILocation(line: 46, column: 23, scope: !65)
!68 = !DILocation(line: 46, column: 9, scope: !62)
!69 = !DILocation(line: 48, column: 23, scope: !70)
!70 = distinct !DILexicalBlock(scope: !65, file: !12, line: 47, column: 9)
!71 = !DILocation(line: 48, column: 28, scope: !70)
!72 = !DILocation(line: 48, column: 18, scope: !70)
!73 = !DILocation(line: 48, column: 13, scope: !70)
!74 = !DILocation(line: 48, column: 21, scope: !70)
!75 = !DILocation(line: 49, column: 9, scope: !70)
!76 = !DILocation(line: 46, column: 35, scope: !65)
!77 = !DILocation(line: 46, column: 9, scope: !65)
!78 = distinct !{!78, !68, !79, !80}
!79 = !DILocation(line: 49, column: 9, scope: !62)
!80 = !{!"llvm.loop.mustprogress"}
!81 = !DILocation(line: 50, column: 9, scope: !44)
!82 = !DILocation(line: 50, column: 20, scope: !44)
!83 = !DILocation(line: 51, column: 19, scope: !44)
!84 = !DILocation(line: 51, column: 9, scope: !44)
!85 = !DILocation(line: 52, column: 14, scope: !44)
!86 = !DILocation(line: 52, column: 9, scope: !44)
!87 = !DILocation(line: 54, column: 1, scope: !21)
!88 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_05_good", scope: !12, file: !12, line: 119, type: !22, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
!89 = !DILocation(line: 121, column: 5, scope: !88)
!90 = !DILocation(line: 122, column: 5, scope: !88)
!91 = !DILocation(line: 123, column: 1, scope: !88)
!92 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 135, type: !93, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
!93 = !DISubroutineType(types: !94)
!94 = !{!13, !13, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !12, line: 135, type: !13)
!97 = !DILocation(line: 135, column: 14, scope: !92)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !12, line: 135, type: !95)
!99 = !DILocation(line: 135, column: 27, scope: !92)
!100 = !DILocation(line: 138, column: 22, scope: !92)
!101 = !DILocation(line: 138, column: 12, scope: !92)
!102 = !DILocation(line: 138, column: 5, scope: !92)
!103 = !DILocation(line: 140, column: 5, scope: !92)
!104 = !DILocation(line: 141, column: 5, scope: !92)
!105 = !DILocation(line: 142, column: 5, scope: !92)
!106 = !DILocation(line: 145, column: 5, scope: !92)
!107 = !DILocation(line: 146, column: 5, scope: !92)
!108 = !DILocation(line: 147, column: 5, scope: !92)
!109 = !DILocation(line: 149, column: 5, scope: !92)
!110 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 61, type: !22, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !24)
!111 = !DILocalVariable(name: "data", scope: !110, file: !12, line: 63, type: !5)
!112 = !DILocation(line: 63, column: 12, scope: !110)
!113 = !DILocation(line: 64, column: 20, scope: !110)
!114 = !DILocation(line: 64, column: 10, scope: !110)
!115 = !DILocation(line: 65, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !110, file: !12, line: 65, column: 9)
!117 = !DILocation(line: 65, column: 14, scope: !116)
!118 = !DILocation(line: 65, column: 9, scope: !110)
!119 = !DILocation(line: 65, column: 24, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !12, line: 65, column: 23)
!121 = !DILocation(line: 66, column: 8, scope: !122)
!122 = distinct !DILexicalBlock(scope: !110, file: !12, line: 66, column: 8)
!123 = !DILocation(line: 66, column: 8, scope: !110)
!124 = !DILocation(line: 69, column: 9, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !12, line: 67, column: 5)
!126 = !DILocation(line: 70, column: 5, scope: !125)
!127 = !DILocation(line: 74, column: 9, scope: !128)
!128 = distinct !DILexicalBlock(scope: !122, file: !12, line: 72, column: 5)
!129 = !DILocation(line: 75, column: 9, scope: !128)
!130 = !DILocation(line: 75, column: 20, scope: !128)
!131 = !DILocalVariable(name: "dest", scope: !132, file: !12, line: 78, type: !45)
!132 = distinct !DILexicalBlock(scope: !110, file: !12, line: 77, column: 5)
!133 = !DILocation(line: 78, column: 14, scope: !132)
!134 = !DILocalVariable(name: "i", scope: !132, file: !12, line: 79, type: !50)
!135 = !DILocation(line: 79, column: 16, scope: !132)
!136 = !DILocalVariable(name: "dataLen", scope: !132, file: !12, line: 79, type: !50)
!137 = !DILocation(line: 79, column: 19, scope: !132)
!138 = !DILocation(line: 80, column: 26, scope: !132)
!139 = !DILocation(line: 80, column: 19, scope: !132)
!140 = !DILocation(line: 80, column: 17, scope: !132)
!141 = !DILocation(line: 82, column: 16, scope: !142)
!142 = distinct !DILexicalBlock(scope: !132, file: !12, line: 82, column: 9)
!143 = !DILocation(line: 82, column: 14, scope: !142)
!144 = !DILocation(line: 82, column: 21, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !12, line: 82, column: 9)
!146 = !DILocation(line: 82, column: 25, scope: !145)
!147 = !DILocation(line: 82, column: 23, scope: !145)
!148 = !DILocation(line: 82, column: 9, scope: !142)
!149 = !DILocation(line: 84, column: 23, scope: !150)
!150 = distinct !DILexicalBlock(scope: !145, file: !12, line: 83, column: 9)
!151 = !DILocation(line: 84, column: 28, scope: !150)
!152 = !DILocation(line: 84, column: 18, scope: !150)
!153 = !DILocation(line: 84, column: 13, scope: !150)
!154 = !DILocation(line: 84, column: 21, scope: !150)
!155 = !DILocation(line: 85, column: 9, scope: !150)
!156 = !DILocation(line: 82, column: 35, scope: !145)
!157 = !DILocation(line: 82, column: 9, scope: !145)
!158 = distinct !{!158, !148, !159, !80}
!159 = !DILocation(line: 85, column: 9, scope: !142)
!160 = !DILocation(line: 86, column: 9, scope: !132)
!161 = !DILocation(line: 86, column: 20, scope: !132)
!162 = !DILocation(line: 87, column: 19, scope: !132)
!163 = !DILocation(line: 87, column: 9, scope: !132)
!164 = !DILocation(line: 88, column: 14, scope: !132)
!165 = !DILocation(line: 88, column: 9, scope: !132)
!166 = !DILocation(line: 90, column: 1, scope: !110)
!167 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 93, type: !22, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !24)
!168 = !DILocalVariable(name: "data", scope: !167, file: !12, line: 95, type: !5)
!169 = !DILocation(line: 95, column: 12, scope: !167)
!170 = !DILocation(line: 96, column: 20, scope: !167)
!171 = !DILocation(line: 96, column: 10, scope: !167)
!172 = !DILocation(line: 97, column: 9, scope: !173)
!173 = distinct !DILexicalBlock(scope: !167, file: !12, line: 97, column: 9)
!174 = !DILocation(line: 97, column: 14, scope: !173)
!175 = !DILocation(line: 97, column: 9, scope: !167)
!176 = !DILocation(line: 97, column: 24, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !12, line: 97, column: 23)
!178 = !DILocation(line: 98, column: 8, scope: !179)
!179 = distinct !DILexicalBlock(scope: !167, file: !12, line: 98, column: 8)
!180 = !DILocation(line: 98, column: 8, scope: !167)
!181 = !DILocation(line: 101, column: 9, scope: !182)
!182 = distinct !DILexicalBlock(scope: !179, file: !12, line: 99, column: 5)
!183 = !DILocation(line: 102, column: 9, scope: !182)
!184 = !DILocation(line: 102, column: 20, scope: !182)
!185 = !DILocation(line: 103, column: 5, scope: !182)
!186 = !DILocalVariable(name: "dest", scope: !187, file: !12, line: 105, type: !45)
!187 = distinct !DILexicalBlock(scope: !167, file: !12, line: 104, column: 5)
!188 = !DILocation(line: 105, column: 14, scope: !187)
!189 = !DILocalVariable(name: "i", scope: !187, file: !12, line: 106, type: !50)
!190 = !DILocation(line: 106, column: 16, scope: !187)
!191 = !DILocalVariable(name: "dataLen", scope: !187, file: !12, line: 106, type: !50)
!192 = !DILocation(line: 106, column: 19, scope: !187)
!193 = !DILocation(line: 107, column: 26, scope: !187)
!194 = !DILocation(line: 107, column: 19, scope: !187)
!195 = !DILocation(line: 107, column: 17, scope: !187)
!196 = !DILocation(line: 109, column: 16, scope: !197)
!197 = distinct !DILexicalBlock(scope: !187, file: !12, line: 109, column: 9)
!198 = !DILocation(line: 109, column: 14, scope: !197)
!199 = !DILocation(line: 109, column: 21, scope: !200)
!200 = distinct !DILexicalBlock(scope: !197, file: !12, line: 109, column: 9)
!201 = !DILocation(line: 109, column: 25, scope: !200)
!202 = !DILocation(line: 109, column: 23, scope: !200)
!203 = !DILocation(line: 109, column: 9, scope: !197)
!204 = !DILocation(line: 111, column: 23, scope: !205)
!205 = distinct !DILexicalBlock(scope: !200, file: !12, line: 110, column: 9)
!206 = !DILocation(line: 111, column: 28, scope: !205)
!207 = !DILocation(line: 111, column: 18, scope: !205)
!208 = !DILocation(line: 111, column: 13, scope: !205)
!209 = !DILocation(line: 111, column: 21, scope: !205)
!210 = !DILocation(line: 112, column: 9, scope: !205)
!211 = !DILocation(line: 109, column: 35, scope: !200)
!212 = !DILocation(line: 109, column: 9, scope: !200)
!213 = distinct !{!213, !203, !214, !80}
!214 = !DILocation(line: 112, column: 9, scope: !197)
!215 = !DILocation(line: 113, column: 9, scope: !187)
!216 = !DILocation(line: 113, column: 20, scope: !187)
!217 = !DILocation(line: 114, column: 19, scope: !187)
!218 = !DILocation(line: 114, column: 9, scope: !187)
!219 = !DILocation(line: 115, column: 14, scope: !187)
!220 = !DILocation(line: 115, column: 9, scope: !187)
!221 = !DILocation(line: 117, column: 1, scope: !167)
