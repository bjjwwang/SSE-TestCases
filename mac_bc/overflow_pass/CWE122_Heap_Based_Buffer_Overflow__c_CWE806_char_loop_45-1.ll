; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_goodG2BData = internal global i8* null, align 8, !dbg !10

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !26
  store i8* %call, i8** %data, align 8, !dbg !27
  %0 = load i8*, i8** %data, align 8, !dbg !28
  %cmp = icmp eq i8* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !34
  %2 = load i8*, i8** %data, align 8, !dbg !34
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !34
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #9, !dbg !34
  %4 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %5 = load i8*, i8** %data, align 8, !dbg !37
  store i8* %5, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_badData, align 8, !dbg !38
  call void @badSink(), !dbg !39
  ret void, !dbg !40
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

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_good() #0 !dbg !41 {
entry:
  call void @goodG2B(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call i64 @time(i64* noundef null), !dbg !53
  %conv = trunc i64 %call to i32, !dbg !54
  call void @srand(i32 noundef %conv), !dbg !55
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_good(), !dbg !57
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_bad(), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !61
  ret i32 0, !dbg !62
}

declare void @srand(i32 noundef) #5

declare i64 @time(i64* noundef) #5

declare void @printLine(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !63 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_badData, align 8, !dbg !66
  store i8* %0, i8** %data, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !67, metadata !DIExpression()), !dbg !72
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !72
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !72
  call void @llvm.dbg.declare(metadata i64* %i, metadata !73, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !80, metadata !DIExpression()), !dbg !81
  %2 = load i8*, i8** %data, align 8, !dbg !82
  %call = call i64 @strlen(i8* noundef %2), !dbg !83
  store i64 %call, i64* %dataLen, align 8, !dbg !84
  store i64 0, i64* %i, align 8, !dbg !85
  br label %for.cond, !dbg !87

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !88
  %4 = load i64, i64* %dataLen, align 8, !dbg !90
  %cmp = icmp ult i64 %3, %4, !dbg !91
  br i1 %cmp, label %for.body, label %for.end, !dbg !92

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !93
  %6 = load i64, i64* %i, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !93
  %7 = load i8, i8* %arrayidx, align 1, !dbg !93
  %8 = load i64, i64* %i, align 8, !dbg !96
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !97
  store i8 %7, i8* %arrayidx1, align 1, !dbg !98
  br label %for.inc, !dbg !99

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !100
  %inc = add i64 %9, 1, !dbg !100
  store i64 %inc, i64* %i, align 8, !dbg !100
  br label %for.cond, !dbg !101, !llvm.loop !102

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !105
  store i8 0, i8* %arrayidx2, align 1, !dbg !106
  %10 = load i8*, i8** %data, align 8, !dbg !107
  call void @printLine(i8* noundef %10), !dbg !108
  %11 = load i8*, i8** %data, align 8, !dbg !109
  call void @free(i8* noundef %11), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

declare i64 @strlen(i8* noundef) #5

declare void @free(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !112 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !113, metadata !DIExpression()), !dbg !114
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !115
  store i8* %call, i8** %data, align 8, !dbg !116
  %0 = load i8*, i8** %data, align 8, !dbg !117
  %cmp = icmp eq i8* %0, null, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !121
  unreachable, !dbg !121

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !123
  %2 = load i8*, i8** %data, align 8, !dbg !123
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !123
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #9, !dbg !123
  %4 = load i8*, i8** %data, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !124
  store i8 0, i8* %arrayidx, align 1, !dbg !125
  %5 = load i8*, i8** %data, align 8, !dbg !126
  store i8* %5, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_goodG2BData, align 8, !dbg !127
  call void @goodG2BSink(), !dbg !128
  ret void, !dbg !129
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !130 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !131, metadata !DIExpression()), !dbg !132
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_goodG2BData, align 8, !dbg !133
  store i8* %0, i8** %data, align 8, !dbg !132
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !134, metadata !DIExpression()), !dbg !136
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !136
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !136
  call void @llvm.dbg.declare(metadata i64* %i, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !139, metadata !DIExpression()), !dbg !140
  %2 = load i8*, i8** %data, align 8, !dbg !141
  %call = call i64 @strlen(i8* noundef %2), !dbg !142
  store i64 %call, i64* %dataLen, align 8, !dbg !143
  store i64 0, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !146

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !147
  %4 = load i64, i64* %dataLen, align 8, !dbg !149
  %cmp = icmp ult i64 %3, %4, !dbg !150
  br i1 %cmp, label %for.body, label %for.end, !dbg !151

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !152
  %6 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !152
  %7 = load i8, i8* %arrayidx, align 1, !dbg !152
  %8 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !156
  store i8 %7, i8* %arrayidx1, align 1, !dbg !157
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !159
  %inc = add i64 %9, 1, !dbg !159
  store i64 %inc, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !160, !llvm.loop !161

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !163
  store i8 0, i8* %arrayidx2, align 1, !dbg !164
  %10 = load i8*, i8** %data, align 8, !dbg !165
  call void @printLine(i8* noundef %10), !dbg !166
  %11 = load i8*, i8** %data, align 8, !dbg !167
  call void @free(i8* noundef %11), !dbg !168
  ret void, !dbg !169
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn writeonly }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_badData", scope: !2, file: !12, line: 21, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !9, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7, !8}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_goodG2BData", scope: !2, file: !12, line: 22, type: !5, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"PIC Level", i32 2}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"Homebrew clang version 14.0.6"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_bad", scope: !12, file: !12, line: 44, type: !21, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !12, line: 46, type: !5)
!25 = !DILocation(line: 46, column: 12, scope: !20)
!26 = !DILocation(line: 47, column: 20, scope: !20)
!27 = !DILocation(line: 47, column: 10, scope: !20)
!28 = !DILocation(line: 48, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !20, file: !12, line: 48, column: 9)
!30 = !DILocation(line: 48, column: 14, scope: !29)
!31 = !DILocation(line: 48, column: 9, scope: !20)
!32 = !DILocation(line: 48, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !12, line: 48, column: 23)
!34 = !DILocation(line: 50, column: 5, scope: !20)
!35 = !DILocation(line: 51, column: 5, scope: !20)
!36 = !DILocation(line: 51, column: 17, scope: !20)
!37 = !DILocation(line: 52, column: 72, scope: !20)
!38 = !DILocation(line: 52, column: 70, scope: !20)
!39 = !DILocation(line: 53, column: 5, scope: !20)
!40 = !DILocation(line: 54, column: 1, scope: !20)
!41 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_45_good", scope: !12, file: !12, line: 91, type: !21, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!42 = !DILocation(line: 93, column: 5, scope: !41)
!43 = !DILocation(line: 94, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 105, type: !45, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!45 = !DISubroutineType(types: !46)
!46 = !{!47, !47, !48}
!47 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !12, line: 105, type: !47)
!50 = !DILocation(line: 105, column: 14, scope: !44)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !12, line: 105, type: !48)
!52 = !DILocation(line: 105, column: 27, scope: !44)
!53 = !DILocation(line: 108, column: 22, scope: !44)
!54 = !DILocation(line: 108, column: 12, scope: !44)
!55 = !DILocation(line: 108, column: 5, scope: !44)
!56 = !DILocation(line: 110, column: 5, scope: !44)
!57 = !DILocation(line: 111, column: 5, scope: !44)
!58 = !DILocation(line: 112, column: 5, scope: !44)
!59 = !DILocation(line: 115, column: 5, scope: !44)
!60 = !DILocation(line: 116, column: 5, scope: !44)
!61 = !DILocation(line: 117, column: 5, scope: !44)
!62 = !DILocation(line: 119, column: 5, scope: !44)
!63 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 26, type: !21, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!64 = !DILocalVariable(name: "data", scope: !63, file: !12, line: 28, type: !5)
!65 = !DILocation(line: 28, column: 12, scope: !63)
!66 = !DILocation(line: 28, column: 19, scope: !63)
!67 = !DILocalVariable(name: "dest", scope: !68, file: !12, line: 30, type: !69)
!68 = distinct !DILexicalBlock(scope: !63, file: !12, line: 29, column: 5)
!69 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 400, elements: !70)
!70 = !{!71}
!71 = !DISubrange(count: 50)
!72 = !DILocation(line: 30, column: 14, scope: !68)
!73 = !DILocalVariable(name: "i", scope: !68, file: !12, line: 31, type: !74)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !75, line: 31, baseType: !76)
!75 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!76 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !77, line: 94, baseType: !78)
!77 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!78 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!79 = !DILocation(line: 31, column: 16, scope: !68)
!80 = !DILocalVariable(name: "dataLen", scope: !68, file: !12, line: 31, type: !74)
!81 = !DILocation(line: 31, column: 19, scope: !68)
!82 = !DILocation(line: 32, column: 26, scope: !68)
!83 = !DILocation(line: 32, column: 19, scope: !68)
!84 = !DILocation(line: 32, column: 17, scope: !68)
!85 = !DILocation(line: 34, column: 16, scope: !86)
!86 = distinct !DILexicalBlock(scope: !68, file: !12, line: 34, column: 9)
!87 = !DILocation(line: 34, column: 14, scope: !86)
!88 = !DILocation(line: 34, column: 21, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !12, line: 34, column: 9)
!90 = !DILocation(line: 34, column: 25, scope: !89)
!91 = !DILocation(line: 34, column: 23, scope: !89)
!92 = !DILocation(line: 34, column: 9, scope: !86)
!93 = !DILocation(line: 36, column: 23, scope: !94)
!94 = distinct !DILexicalBlock(scope: !89, file: !12, line: 35, column: 9)
!95 = !DILocation(line: 36, column: 28, scope: !94)
!96 = !DILocation(line: 36, column: 18, scope: !94)
!97 = !DILocation(line: 36, column: 13, scope: !94)
!98 = !DILocation(line: 36, column: 21, scope: !94)
!99 = !DILocation(line: 37, column: 9, scope: !94)
!100 = !DILocation(line: 34, column: 35, scope: !89)
!101 = !DILocation(line: 34, column: 9, scope: !89)
!102 = distinct !{!102, !92, !103, !104}
!103 = !DILocation(line: 37, column: 9, scope: !86)
!104 = !{!"llvm.loop.mustprogress"}
!105 = !DILocation(line: 38, column: 9, scope: !68)
!106 = !DILocation(line: 38, column: 20, scope: !68)
!107 = !DILocation(line: 39, column: 19, scope: !68)
!108 = !DILocation(line: 39, column: 9, scope: !68)
!109 = !DILocation(line: 40, column: 14, scope: !68)
!110 = !DILocation(line: 40, column: 9, scope: !68)
!111 = !DILocation(line: 42, column: 1, scope: !63)
!112 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 79, type: !21, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!113 = !DILocalVariable(name: "data", scope: !112, file: !12, line: 81, type: !5)
!114 = !DILocation(line: 81, column: 12, scope: !112)
!115 = !DILocation(line: 82, column: 20, scope: !112)
!116 = !DILocation(line: 82, column: 10, scope: !112)
!117 = !DILocation(line: 83, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !12, line: 83, column: 9)
!119 = !DILocation(line: 83, column: 14, scope: !118)
!120 = !DILocation(line: 83, column: 9, scope: !112)
!121 = !DILocation(line: 83, column: 24, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !12, line: 83, column: 23)
!123 = !DILocation(line: 85, column: 5, scope: !112)
!124 = !DILocation(line: 86, column: 5, scope: !112)
!125 = !DILocation(line: 86, column: 16, scope: !112)
!126 = !DILocation(line: 87, column: 76, scope: !112)
!127 = !DILocation(line: 87, column: 74, scope: !112)
!128 = !DILocation(line: 88, column: 5, scope: !112)
!129 = !DILocation(line: 89, column: 1, scope: !112)
!130 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 61, type: !21, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!131 = !DILocalVariable(name: "data", scope: !130, file: !12, line: 63, type: !5)
!132 = !DILocation(line: 63, column: 12, scope: !130)
!133 = !DILocation(line: 63, column: 19, scope: !130)
!134 = !DILocalVariable(name: "dest", scope: !135, file: !12, line: 65, type: !69)
!135 = distinct !DILexicalBlock(scope: !130, file: !12, line: 64, column: 5)
!136 = !DILocation(line: 65, column: 14, scope: !135)
!137 = !DILocalVariable(name: "i", scope: !135, file: !12, line: 66, type: !74)
!138 = !DILocation(line: 66, column: 16, scope: !135)
!139 = !DILocalVariable(name: "dataLen", scope: !135, file: !12, line: 66, type: !74)
!140 = !DILocation(line: 66, column: 19, scope: !135)
!141 = !DILocation(line: 67, column: 26, scope: !135)
!142 = !DILocation(line: 67, column: 19, scope: !135)
!143 = !DILocation(line: 67, column: 17, scope: !135)
!144 = !DILocation(line: 69, column: 16, scope: !145)
!145 = distinct !DILexicalBlock(scope: !135, file: !12, line: 69, column: 9)
!146 = !DILocation(line: 69, column: 14, scope: !145)
!147 = !DILocation(line: 69, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !12, line: 69, column: 9)
!149 = !DILocation(line: 69, column: 25, scope: !148)
!150 = !DILocation(line: 69, column: 23, scope: !148)
!151 = !DILocation(line: 69, column: 9, scope: !145)
!152 = !DILocation(line: 71, column: 23, scope: !153)
!153 = distinct !DILexicalBlock(scope: !148, file: !12, line: 70, column: 9)
!154 = !DILocation(line: 71, column: 28, scope: !153)
!155 = !DILocation(line: 71, column: 18, scope: !153)
!156 = !DILocation(line: 71, column: 13, scope: !153)
!157 = !DILocation(line: 71, column: 21, scope: !153)
!158 = !DILocation(line: 72, column: 9, scope: !153)
!159 = !DILocation(line: 69, column: 35, scope: !148)
!160 = !DILocation(line: 69, column: 9, scope: !148)
!161 = distinct !{!161, !151, !162, !104}
!162 = !DILocation(line: 72, column: 9, scope: !145)
!163 = !DILocation(line: 73, column: 9, scope: !135)
!164 = !DILocation(line: 73, column: 20, scope: !135)
!165 = !DILocation(line: 74, column: 19, scope: !135)
!166 = !DILocation(line: 74, column: 9, scope: !135)
!167 = !DILocation(line: 75, column: 14, scope: !135)
!168 = !DILocation(line: 75, column: 9, scope: !135)
!169 = !DILocation(line: 77, column: 1, scope: !130)
