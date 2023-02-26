; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_05-1.c"
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
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
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !49
  %7 = load i8*, i8** %data, align 8, !dbg !49
  %8 = load i8*, i8** %data, align 8, !dbg !49
  %call4 = call i64 @strlen(i8* noundef %8), !dbg !49
  %mul = mul i64 %call4, 1, !dbg !49
  %call5 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef %mul, i64 noundef 50) #9, !dbg !49
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !50
  store i8 0, i8* %arrayidx6, align 1, !dbg !51
  %9 = load i8*, i8** %data, align 8, !dbg !52
  call void @printLine(i8* noundef %9), !dbg !53
  %10 = load i8*, i8** %data, align 8, !dbg !54
  call void @free(i8* noundef %10), !dbg !55
  ret void, !dbg !56
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

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

declare i64 @strlen(i8* noundef) #6

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_05_good() #0 !dbg !57 {
entry:
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* noundef null), !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 noundef %conv), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_05_good(), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_05_bad(), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !79 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !82
  store i8* %call, i8** %data, align 8, !dbg !83
  %0 = load i8*, i8** %data, align 8, !dbg !84
  %cmp = icmp eq i8* %0, null, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !88
  unreachable, !dbg !88

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticFalse, align 4, !dbg !90
  %tobool = icmp ne i32 %1, 0, !dbg !90
  br i1 %tobool, label %if.then1, label %if.else, !dbg !92

if.then1:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  br label %if.end3, !dbg !95

if.else:                                          ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !96
  %3 = load i8*, i8** %data, align 8, !dbg !96
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !96
  %call2 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #9, !dbg !96
  %5 = load i8*, i8** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !98
  store i8 0, i8* %arrayidx, align 1, !dbg !99
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then1
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !100, metadata !DIExpression()), !dbg !102
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !102
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !103
  %7 = load i8*, i8** %data, align 8, !dbg !103
  %8 = load i8*, i8** %data, align 8, !dbg !103
  %call4 = call i64 @strlen(i8* noundef %8), !dbg !103
  %mul = mul i64 %call4, 1, !dbg !103
  %call5 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef %mul, i64 noundef 50) #9, !dbg !103
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !104
  store i8 0, i8* %arrayidx6, align 1, !dbg !105
  %9 = load i8*, i8** %data, align 8, !dbg !106
  call void @printLine(i8* noundef %9), !dbg !107
  %10 = load i8*, i8** %data, align 8, !dbg !108
  call void @free(i8* noundef %10), !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !111 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !112, metadata !DIExpression()), !dbg !113
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !114
  store i8* %call, i8** %data, align 8, !dbg !115
  %0 = load i8*, i8** %data, align 8, !dbg !116
  %cmp = icmp eq i8* %0, null, !dbg !118
  br i1 %cmp, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !120
  unreachable, !dbg !120

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !122
  %tobool = icmp ne i32 %1, 0, !dbg !122
  br i1 %tobool, label %if.then1, label %if.end3, !dbg !124

if.then1:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !125
  %3 = load i8*, i8** %data, align 8, !dbg !125
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !125
  %call2 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #9, !dbg !125
  %5 = load i8*, i8** %data, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !127
  store i8 0, i8* %arrayidx, align 1, !dbg !128
  br label %if.end3, !dbg !129

if.end3:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !130, metadata !DIExpression()), !dbg !132
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !132
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !133
  %7 = load i8*, i8** %data, align 8, !dbg !133
  %8 = load i8*, i8** %data, align 8, !dbg !133
  %call4 = call i64 @strlen(i8* noundef %8), !dbg !133
  %mul = mul i64 %call4, 1, !dbg !133
  %call5 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef %mul, i64 noundef 50) #9, !dbg !133
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !134
  store i8 0, i8* %arrayidx6, align 1, !dbg !135
  %9 = load i8*, i8** %data, align 8, !dbg !136
  call void @printLine(i8* noundef %9), !dbg !137
  %10 = load i8*, i8** %data, align 8, !dbg !138
  call void @free(i8* noundef %10), !dbg !139
  ret void, !dbg !140
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
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7, !8}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !12, line: 26, type: !13, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"PIC Level", i32 2}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"Homebrew clang version 14.0.6"}
!21 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_05_bad", scope: !12, file: !12, line: 30, type: !22, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
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
!49 = !DILocation(line: 44, column: 9, scope: !44)
!50 = !DILocation(line: 45, column: 9, scope: !44)
!51 = !DILocation(line: 45, column: 20, scope: !44)
!52 = !DILocation(line: 46, column: 19, scope: !44)
!53 = !DILocation(line: 46, column: 9, scope: !44)
!54 = !DILocation(line: 47, column: 14, scope: !44)
!55 = !DILocation(line: 47, column: 9, scope: !44)
!56 = !DILocation(line: 49, column: 1, scope: !21)
!57 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_05_good", scope: !12, file: !12, line: 104, type: !22, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
!58 = !DILocation(line: 106, column: 5, scope: !57)
!59 = !DILocation(line: 107, column: 5, scope: !57)
!60 = !DILocation(line: 108, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 120, type: !62, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
!62 = !DISubroutineType(types: !63)
!63 = !{!13, !13, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !12, line: 120, type: !13)
!66 = !DILocation(line: 120, column: 14, scope: !61)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !12, line: 120, type: !64)
!68 = !DILocation(line: 120, column: 27, scope: !61)
!69 = !DILocation(line: 123, column: 22, scope: !61)
!70 = !DILocation(line: 123, column: 12, scope: !61)
!71 = !DILocation(line: 123, column: 5, scope: !61)
!72 = !DILocation(line: 125, column: 5, scope: !61)
!73 = !DILocation(line: 126, column: 5, scope: !61)
!74 = !DILocation(line: 127, column: 5, scope: !61)
!75 = !DILocation(line: 130, column: 5, scope: !61)
!76 = !DILocation(line: 131, column: 5, scope: !61)
!77 = !DILocation(line: 132, column: 5, scope: !61)
!78 = !DILocation(line: 134, column: 5, scope: !61)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 56, type: !22, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !24)
!80 = !DILocalVariable(name: "data", scope: !79, file: !12, line: 58, type: !5)
!81 = !DILocation(line: 58, column: 12, scope: !79)
!82 = !DILocation(line: 59, column: 20, scope: !79)
!83 = !DILocation(line: 59, column: 10, scope: !79)
!84 = !DILocation(line: 60, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !79, file: !12, line: 60, column: 9)
!86 = !DILocation(line: 60, column: 14, scope: !85)
!87 = !DILocation(line: 60, column: 9, scope: !79)
!88 = !DILocation(line: 60, column: 24, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !12, line: 60, column: 23)
!90 = !DILocation(line: 61, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !79, file: !12, line: 61, column: 8)
!92 = !DILocation(line: 61, column: 8, scope: !79)
!93 = !DILocation(line: 64, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !12, line: 62, column: 5)
!95 = !DILocation(line: 65, column: 5, scope: !94)
!96 = !DILocation(line: 69, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !91, file: !12, line: 67, column: 5)
!98 = !DILocation(line: 70, column: 9, scope: !97)
!99 = !DILocation(line: 70, column: 20, scope: !97)
!100 = !DILocalVariable(name: "dest", scope: !101, file: !12, line: 73, type: !45)
!101 = distinct !DILexicalBlock(scope: !79, file: !12, line: 72, column: 5)
!102 = !DILocation(line: 73, column: 14, scope: !101)
!103 = !DILocation(line: 75, column: 9, scope: !101)
!104 = !DILocation(line: 76, column: 9, scope: !101)
!105 = !DILocation(line: 76, column: 20, scope: !101)
!106 = !DILocation(line: 77, column: 19, scope: !101)
!107 = !DILocation(line: 77, column: 9, scope: !101)
!108 = !DILocation(line: 78, column: 14, scope: !101)
!109 = !DILocation(line: 78, column: 9, scope: !101)
!110 = !DILocation(line: 80, column: 1, scope: !79)
!111 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 83, type: !22, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !24)
!112 = !DILocalVariable(name: "data", scope: !111, file: !12, line: 85, type: !5)
!113 = !DILocation(line: 85, column: 12, scope: !111)
!114 = !DILocation(line: 86, column: 20, scope: !111)
!115 = !DILocation(line: 86, column: 10, scope: !111)
!116 = !DILocation(line: 87, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !111, file: !12, line: 87, column: 9)
!118 = !DILocation(line: 87, column: 14, scope: !117)
!119 = !DILocation(line: 87, column: 9, scope: !111)
!120 = !DILocation(line: 87, column: 24, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !12, line: 87, column: 23)
!122 = !DILocation(line: 88, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !111, file: !12, line: 88, column: 8)
!124 = !DILocation(line: 88, column: 8, scope: !111)
!125 = !DILocation(line: 91, column: 9, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !12, line: 89, column: 5)
!127 = !DILocation(line: 92, column: 9, scope: !126)
!128 = !DILocation(line: 92, column: 20, scope: !126)
!129 = !DILocation(line: 93, column: 5, scope: !126)
!130 = !DILocalVariable(name: "dest", scope: !131, file: !12, line: 95, type: !45)
!131 = distinct !DILexicalBlock(scope: !111, file: !12, line: 94, column: 5)
!132 = !DILocation(line: 95, column: 14, scope: !131)
!133 = !DILocation(line: 97, column: 9, scope: !131)
!134 = !DILocation(line: 98, column: 9, scope: !131)
!135 = !DILocation(line: 98, column: 20, scope: !131)
!136 = !DILocation(line: 99, column: 19, scope: !131)
!137 = !DILocation(line: 99, column: 9, scope: !131)
!138 = !DILocation(line: 100, column: 14, scope: !131)
!139 = !DILocation(line: 100, column: 9, scope: !131)
!140 = !DILocation(line: 102, column: 1, scope: !111)
