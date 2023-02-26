; ModuleID = 'linux_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_05-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_05-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_05_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %0 = load i32, i32* @staticTrue, align 4, !dbg !35
  %tobool = icmp ne i32 %0, 0, !dbg !35
  br i1 %tobool, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i8* %arraydecay, i8** %data, align 8, !dbg !40
  %1 = load i8*, i8** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !41
  store i8 0, i8* %arrayidx, align 1, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !44, metadata !DIExpression()), !dbg !46
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_05_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !46
  %3 = load i8*, i8** %data, align 8, !dbg !47
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !48
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !49
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !50
  %add = add i64 %call, 1, !dbg !51
  %mul = mul i64 %add, 1, !dbg !52
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 %arraydecay1, i64 %mul, i1 false), !dbg !48
  %4 = load i8*, i8** %data, align 8, !dbg !53
  call void @printLine(i8* %4), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_05_good() #0 !dbg !56 {
entry:
  call void @goodG2B1(), !dbg !57
  call void @goodG2B2(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #7, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #7, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_05_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_05_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %0 = load i32, i32* @staticFalse, align 4, !dbg !85
  %tobool = icmp ne i32 %0, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end, !dbg !90

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !91
  store i8* %arraydecay, i8** %data, align 8, !dbg !93
  %1 = load i8*, i8** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !94
  store i8 0, i8* %arrayidx, align 1, !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !96, metadata !DIExpression()), !dbg !98
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !98
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !98
  %3 = load i8*, i8** %data, align 8, !dbg !99
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !100
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !101
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !102
  %add = add i64 %call, 1, !dbg !103
  %mul = mul i64 %add, 1, !dbg !104
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 %arraydecay1, i64 %mul, i1 false), !dbg !100
  %4 = load i8*, i8** %data, align 8, !dbg !105
  call void @printLine(i8* %4), !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !108 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %0 = load i32, i32* @staticTrue, align 4, !dbg !115
  %tobool = icmp ne i32 %0, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !118
  store i8* %arraydecay, i8** %data, align 8, !dbg !120
  %1 = load i8*, i8** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !121
  store i8 0, i8* %arrayidx, align 1, !dbg !122
  br label %if.end, !dbg !123

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !124, metadata !DIExpression()), !dbg !126
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !126
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !126
  %3 = load i8*, i8** %data, align 8, !dbg !127
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !128
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !129
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !130
  %add = add i64 %call, 1, !dbg !131
  %mul = mul i64 %add, 1, !dbg !132
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 %arraydecay1, i64 %mul, i1 false), !dbg !128
  %4 = load i8*, i8** %data, align 8, !dbg !133
  call void @printLine(i8* %4), !dbg !134
  ret void, !dbg !135
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 30, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_05-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 31, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_05-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_05_bad", scope: !10, file: !10, line: 35, type: !19, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 37, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !DILocation(line: 37, column: 12, scope: !18)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !10, line: 38, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 80, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 10)
!29 = !DILocation(line: 38, column: 10, scope: !18)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !10, line: 39, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 88, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 11)
!34 = !DILocation(line: 39, column: 10, scope: !18)
!35 = !DILocation(line: 40, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !18, file: !10, line: 40, column: 8)
!37 = !DILocation(line: 40, column: 8, scope: !18)
!38 = !DILocation(line: 44, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !10, line: 41, column: 5)
!40 = !DILocation(line: 44, column: 14, scope: !39)
!41 = !DILocation(line: 45, column: 9, scope: !39)
!42 = !DILocation(line: 45, column: 17, scope: !39)
!43 = !DILocation(line: 46, column: 5, scope: !39)
!44 = !DILocalVariable(name: "source", scope: !45, file: !10, line: 48, type: !31)
!45 = distinct !DILexicalBlock(scope: !18, file: !10, line: 47, column: 5)
!46 = !DILocation(line: 48, column: 14, scope: !45)
!47 = !DILocation(line: 51, column: 17, scope: !45)
!48 = !DILocation(line: 51, column: 9, scope: !45)
!49 = !DILocation(line: 51, column: 39, scope: !45)
!50 = !DILocation(line: 51, column: 32, scope: !45)
!51 = !DILocation(line: 51, column: 47, scope: !45)
!52 = !DILocation(line: 51, column: 52, scope: !45)
!53 = !DILocation(line: 52, column: 19, scope: !45)
!54 = !DILocation(line: 52, column: 9, scope: !45)
!55 = !DILocation(line: 54, column: 1, scope: !18)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_05_good", scope: !10, file: !10, line: 109, type: !19, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DILocation(line: 111, column: 5, scope: !56)
!58 = !DILocation(line: 112, column: 5, scope: !56)
!59 = !DILocation(line: 113, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 125, type: !61, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DISubroutineType(types: !62)
!62 = !{!11, !11, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !10, line: 125, type: !11)
!65 = !DILocation(line: 125, column: 14, scope: !60)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !10, line: 125, type: !63)
!67 = !DILocation(line: 125, column: 27, scope: !60)
!68 = !DILocation(line: 128, column: 22, scope: !60)
!69 = !DILocation(line: 128, column: 12, scope: !60)
!70 = !DILocation(line: 128, column: 5, scope: !60)
!71 = !DILocation(line: 130, column: 5, scope: !60)
!72 = !DILocation(line: 131, column: 5, scope: !60)
!73 = !DILocation(line: 132, column: 5, scope: !60)
!74 = !DILocation(line: 135, column: 5, scope: !60)
!75 = !DILocation(line: 136, column: 5, scope: !60)
!76 = !DILocation(line: 137, column: 5, scope: !60)
!77 = !DILocation(line: 139, column: 5, scope: !60)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 61, type: !19, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocalVariable(name: "data", scope: !78, file: !10, line: 63, type: !22)
!80 = !DILocation(line: 63, column: 12, scope: !78)
!81 = !DILocalVariable(name: "dataBadBuffer", scope: !78, file: !10, line: 64, type: !26)
!82 = !DILocation(line: 64, column: 10, scope: !78)
!83 = !DILocalVariable(name: "dataGoodBuffer", scope: !78, file: !10, line: 65, type: !31)
!84 = !DILocation(line: 65, column: 10, scope: !78)
!85 = !DILocation(line: 66, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !78, file: !10, line: 66, column: 8)
!87 = !DILocation(line: 66, column: 8, scope: !78)
!88 = !DILocation(line: 69, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !10, line: 67, column: 5)
!90 = !DILocation(line: 70, column: 5, scope: !89)
!91 = !DILocation(line: 75, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !10, line: 72, column: 5)
!93 = !DILocation(line: 75, column: 14, scope: !92)
!94 = !DILocation(line: 76, column: 9, scope: !92)
!95 = !DILocation(line: 76, column: 17, scope: !92)
!96 = !DILocalVariable(name: "source", scope: !97, file: !10, line: 79, type: !31)
!97 = distinct !DILexicalBlock(scope: !78, file: !10, line: 78, column: 5)
!98 = !DILocation(line: 79, column: 14, scope: !97)
!99 = !DILocation(line: 82, column: 17, scope: !97)
!100 = !DILocation(line: 82, column: 9, scope: !97)
!101 = !DILocation(line: 82, column: 39, scope: !97)
!102 = !DILocation(line: 82, column: 32, scope: !97)
!103 = !DILocation(line: 82, column: 47, scope: !97)
!104 = !DILocation(line: 82, column: 52, scope: !97)
!105 = !DILocation(line: 83, column: 19, scope: !97)
!106 = !DILocation(line: 83, column: 9, scope: !97)
!107 = !DILocation(line: 85, column: 1, scope: !78)
!108 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 88, type: !19, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!109 = !DILocalVariable(name: "data", scope: !108, file: !10, line: 90, type: !22)
!110 = !DILocation(line: 90, column: 12, scope: !108)
!111 = !DILocalVariable(name: "dataBadBuffer", scope: !108, file: !10, line: 91, type: !26)
!112 = !DILocation(line: 91, column: 10, scope: !108)
!113 = !DILocalVariable(name: "dataGoodBuffer", scope: !108, file: !10, line: 92, type: !31)
!114 = !DILocation(line: 92, column: 10, scope: !108)
!115 = !DILocation(line: 93, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !108, file: !10, line: 93, column: 8)
!117 = !DILocation(line: 93, column: 8, scope: !108)
!118 = !DILocation(line: 97, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !10, line: 94, column: 5)
!120 = !DILocation(line: 97, column: 14, scope: !119)
!121 = !DILocation(line: 98, column: 9, scope: !119)
!122 = !DILocation(line: 98, column: 17, scope: !119)
!123 = !DILocation(line: 99, column: 5, scope: !119)
!124 = !DILocalVariable(name: "source", scope: !125, file: !10, line: 101, type: !31)
!125 = distinct !DILexicalBlock(scope: !108, file: !10, line: 100, column: 5)
!126 = !DILocation(line: 101, column: 14, scope: !125)
!127 = !DILocation(line: 104, column: 17, scope: !125)
!128 = !DILocation(line: 104, column: 9, scope: !125)
!129 = !DILocation(line: 104, column: 39, scope: !125)
!130 = !DILocation(line: 104, column: 32, scope: !125)
!131 = !DILocation(line: 104, column: 47, scope: !125)
!132 = !DILocation(line: 104, column: 52, scope: !125)
!133 = !DILocation(line: 105, column: 19, scope: !125)
!134 = !DILocation(line: 105, column: 9, scope: !125)
!135 = !DILocation(line: 107, column: 1, scope: !108)
