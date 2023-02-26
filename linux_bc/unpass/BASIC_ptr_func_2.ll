; ModuleID = 'linux_bc/unpass/BASIC_ptr_func_2.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/unpass/BASIC_ptr_func_2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %p = alloca i32 ()*, align 8
  %q = alloca i32 ()*, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !17, metadata !DIExpression()), !dbg !18
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32 ()** %p, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32 ()** %q, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = load i32, i32* %argc.addr, align 4, !dbg !28
  %cmp = icmp eq i32 %0, 1, !dbg !30
  br i1 %cmp, label %if.then, label %if.else, !dbg !31

if.then:                                          ; preds = %entry
  store i32 ()* @a, i32 ()** %p, align 8, !dbg !32
  store i32 ()* @c, i32 ()** %q, align 8, !dbg !34
  br label %if.end, !dbg !35

if.else:                                          ; preds = %entry
  store i32 ()* @b, i32 ()** %p, align 8, !dbg !36
  store i32 ()* @d, i32 ()** %q, align 8, !dbg !38
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i32* %x, metadata !39, metadata !DIExpression()), !dbg !40
  %1 = load i32 ()*, i32 ()** %p, align 8, !dbg !41
  %call = call i32 %1(), !dbg !41
  store i32 %call, i32* %x, align 4, !dbg !40
  call void @llvm.dbg.declare(metadata i32* %y, metadata !42, metadata !DIExpression()), !dbg !43
  %2 = load i32 ()*, i32 ()** %q, align 8, !dbg !44
  %call1 = call i32 %2(), !dbg !44
  store i32 %call1, i32* %y, align 4, !dbg !43
  %3 = load i32, i32* %x, align 4, !dbg !45
  %cmp2 = icmp sge i32 %3, 5, !dbg !46
  call void @svf_assert(i1 zeroext %cmp2), !dbg !47
  ret i32 0, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @a() #0 !dbg !49 {
entry:
  ret i32 10, !dbg !50
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @c() #0 !dbg !51 {
entry:
  ret i32 15, !dbg !52
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @b() #0 !dbg !53 {
entry:
  ret i32 5, !dbg !54
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @d() #0 !dbg !55 {
entry:
  ret i32 20, !dbg !56
}

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/unpass/BASIC_ptr_func_2.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/unpass/BASIC_ptr_func_2.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13, !14}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !DILocalVariable(name: "argc", arg: 1, scope: !9, file: !10, line: 8, type: !13)
!18 = !DILocation(line: 8, column: 14, scope: !9)
!19 = !DILocalVariable(name: "argv", arg: 2, scope: !9, file: !10, line: 8, type: !14)
!20 = !DILocation(line: 8, column: 27, scope: !9)
!21 = !DILocalVariable(name: "p", scope: !9, file: !10, line: 9, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{!13}
!25 = !DILocation(line: 9, column: 9, scope: !9)
!26 = !DILocalVariable(name: "q", scope: !9, file: !10, line: 10, type: !22)
!27 = !DILocation(line: 10, column: 9, scope: !9)
!28 = !DILocation(line: 12, column: 7, scope: !29)
!29 = distinct !DILexicalBlock(scope: !9, file: !10, line: 12, column: 7)
!30 = !DILocation(line: 12, column: 12, scope: !29)
!31 = !DILocation(line: 12, column: 7, scope: !9)
!32 = !DILocation(line: 13, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !10, line: 12, column: 18)
!34 = !DILocation(line: 14, column: 9, scope: !33)
!35 = !DILocation(line: 15, column: 3, scope: !33)
!36 = !DILocation(line: 16, column: 9, scope: !37)
!37 = distinct !DILexicalBlock(scope: !29, file: !10, line: 15, column: 10)
!38 = !DILocation(line: 17, column: 9, scope: !37)
!39 = !DILocalVariable(name: "x", scope: !9, file: !10, line: 20, type: !13)
!40 = !DILocation(line: 20, column: 7, scope: !9)
!41 = !DILocation(line: 20, column: 11, scope: !9)
!42 = !DILocalVariable(name: "y", scope: !9, file: !10, line: 21, type: !13)
!43 = !DILocation(line: 21, column: 7, scope: !9)
!44 = !DILocation(line: 21, column: 11, scope: !9)
!45 = !DILocation(line: 23, column: 14, scope: !9)
!46 = !DILocation(line: 23, column: 16, scope: !9)
!47 = !DILocation(line: 23, column: 3, scope: !9)
!48 = !DILocation(line: 29, column: 3, scope: !9)
!49 = distinct !DISubprogram(name: "a", scope: !10, file: !10, line: 32, type: !23, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 32, column: 10, scope: !49)
!51 = distinct !DISubprogram(name: "c", scope: !10, file: !10, line: 34, type: !23, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 34, column: 10, scope: !51)
!53 = distinct !DISubprogram(name: "b", scope: !10, file: !10, line: 33, type: !23, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 33, column: 10, scope: !53)
!55 = distinct !DISubprogram(name: "d", scope: !10, file: !10, line: 35, type: !23, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 35, column: 10, scope: !55)
