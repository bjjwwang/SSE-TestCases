; ModuleID = 'linux_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_01-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_01-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_01_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_01_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 10) #6, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  %0 = load i8*, i8** %data, align 8, !dbg !23
  %cmp = icmp eq i8* %0, null, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !27
  unreachable, !dbg !27

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !29, metadata !DIExpression()), !dbg !34
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !34
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_01_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !34
  %2 = load i8*, i8** %data, align 8, !dbg !35
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !36
  %call1 = call i8* @strcpy(i8* %2, i8* %arraydecay) #6, !dbg !37
  %3 = load i8*, i8** %data, align 8, !dbg !38
  call void @printLine(i8* %3), !dbg !39
  %4 = load i8*, i8** %data, align 8, !dbg !40
  call void @free(i8* %4) #6, !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_01_good() #0 !dbg !43 {
entry:
  call void @goodG2B(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* null) #6, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #6, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_01_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_01_bad(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !65 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !66, metadata !DIExpression()), !dbg !67
  store i8* null, i8** %data, align 8, !dbg !68
  %call = call noalias align 16 i8* @malloc(i64 11) #6, !dbg !69
  store i8* %call, i8** %data, align 8, !dbg !70
  %0 = load i8*, i8** %data, align 8, !dbg !71
  %cmp = icmp eq i8* %0, null, !dbg !73
  br i1 %cmp, label %if.then, label %if.end, !dbg !74

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !75
  unreachable, !dbg !75

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !77, metadata !DIExpression()), !dbg !79
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !79
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !79
  %2 = load i8*, i8** %data, align 8, !dbg !80
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !81
  %call1 = call i8* @strcpy(i8* %2, i8* %arraydecay) #6, !dbg !82
  %3 = load i8*, i8** %data, align 8, !dbg !83
  call void @printLine(i8* %3), !dbg !84
  %4 = load i8*, i8** %data, align 8, !dbg !85
  call void @free(i8* %4) #6, !dbg !86
  ret void, !dbg !87
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_01-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_01_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_01-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !4)
!19 = !DILocation(line: 30, column: 12, scope: !14)
!20 = !DILocation(line: 31, column: 10, scope: !14)
!21 = !DILocation(line: 33, column: 20, scope: !14)
!22 = !DILocation(line: 33, column: 10, scope: !14)
!23 = !DILocation(line: 34, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 9)
!25 = !DILocation(line: 34, column: 14, scope: !24)
!26 = !DILocation(line: 34, column: 9, scope: !14)
!27 = !DILocation(line: 34, column: 24, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !15, line: 34, column: 23)
!29 = !DILocalVariable(name: "source", scope: !30, file: !15, line: 36, type: !31)
!30 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 11)
!34 = !DILocation(line: 36, column: 14, scope: !30)
!35 = !DILocation(line: 38, column: 16, scope: !30)
!36 = !DILocation(line: 38, column: 22, scope: !30)
!37 = !DILocation(line: 38, column: 9, scope: !30)
!38 = !DILocation(line: 39, column: 19, scope: !30)
!39 = !DILocation(line: 39, column: 9, scope: !30)
!40 = !DILocation(line: 40, column: 14, scope: !30)
!41 = !DILocation(line: 40, column: 9, scope: !30)
!42 = !DILocation(line: 42, column: 1, scope: !14)
!43 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_01_good", scope: !15, file: !15, line: 65, type: !16, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocation(line: 67, column: 5, scope: !43)
!45 = !DILocation(line: 68, column: 1, scope: !43)
!46 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 80, type: !47, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!49, !49, !50}
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !15, line: 80, type: !49)
!52 = !DILocation(line: 80, column: 14, scope: !46)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !15, line: 80, type: !50)
!54 = !DILocation(line: 80, column: 27, scope: !46)
!55 = !DILocation(line: 83, column: 22, scope: !46)
!56 = !DILocation(line: 83, column: 12, scope: !46)
!57 = !DILocation(line: 83, column: 5, scope: !46)
!58 = !DILocation(line: 85, column: 5, scope: !46)
!59 = !DILocation(line: 86, column: 5, scope: !46)
!60 = !DILocation(line: 87, column: 5, scope: !46)
!61 = !DILocation(line: 90, column: 5, scope: !46)
!62 = !DILocation(line: 91, column: 5, scope: !46)
!63 = !DILocation(line: 92, column: 5, scope: !46)
!64 = !DILocation(line: 94, column: 5, scope: !46)
!65 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 49, type: !16, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocalVariable(name: "data", scope: !65, file: !15, line: 51, type: !4)
!67 = !DILocation(line: 51, column: 12, scope: !65)
!68 = !DILocation(line: 52, column: 10, scope: !65)
!69 = !DILocation(line: 54, column: 20, scope: !65)
!70 = !DILocation(line: 54, column: 10, scope: !65)
!71 = !DILocation(line: 55, column: 9, scope: !72)
!72 = distinct !DILexicalBlock(scope: !65, file: !15, line: 55, column: 9)
!73 = !DILocation(line: 55, column: 14, scope: !72)
!74 = !DILocation(line: 55, column: 9, scope: !65)
!75 = !DILocation(line: 55, column: 24, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !15, line: 55, column: 23)
!77 = !DILocalVariable(name: "source", scope: !78, file: !15, line: 57, type: !31)
!78 = distinct !DILexicalBlock(scope: !65, file: !15, line: 56, column: 5)
!79 = !DILocation(line: 57, column: 14, scope: !78)
!80 = !DILocation(line: 59, column: 16, scope: !78)
!81 = !DILocation(line: 59, column: 22, scope: !78)
!82 = !DILocation(line: 59, column: 9, scope: !78)
!83 = !DILocation(line: 60, column: 19, scope: !78)
!84 = !DILocation(line: 60, column: 9, scope: !78)
!85 = !DILocation(line: 61, column: 14, scope: !78)
!86 = !DILocation(line: 61, column: 9, scope: !78)
!87 = !DILocation(line: 63, column: 1, scope: !65)
