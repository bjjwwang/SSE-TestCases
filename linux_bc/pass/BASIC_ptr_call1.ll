; ModuleID = 'linux_bc/pass/BASIC_ptr_call1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_ptr_call1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %p = alloca i32 ()*, align 8
  %q = alloca i32 (i32)*, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32 ()** %p, metadata !14, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32 (i32)** %q, metadata !17, metadata !DIExpression()), !dbg !21
  %call = call i32 @nd_int(), !dbg !22
  %tobool = icmp ne i32 %call, 0, !dbg !22
  br i1 %tobool, label %if.then, label %if.end, !dbg !24

if.then:                                          ; preds = %entry
  br label %if.end, !dbg !25

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i32* %x, metadata !27, metadata !DIExpression()), !dbg !28
  %call1 = call i32 @a(), !dbg !29
  store i32 %call1, i32* %x, align 4, !dbg !28
  call void @llvm.dbg.declare(metadata i32* %y, metadata !30, metadata !DIExpression()), !dbg !31
  %call2 = call i32 @c(i32 2), !dbg !32
  store i32 %call2, i32* %y, align 4, !dbg !31
  %0 = load i32, i32* %x, align 4, !dbg !33
  %cmp = icmp sge i32 %0, 5, !dbg !34
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !35

land.rhs:                                         ; preds = %if.end
  %1 = load i32, i32* %y, align 4, !dbg !36
  %cmp3 = icmp sge i32 %1, 7, !dbg !37
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end
  %2 = phi i1 [ false, %if.end ], [ %cmp3, %land.rhs ], !dbg !38
  call void @svf_assert(i1 zeroext %2), !dbg !39
  ret i32 0, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @nd_int() #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @a() #0 !dbg !41 {
entry:
  ret i32 10, !dbg !42
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @c(i32 %x) #0 !dbg !43 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !44, metadata !DIExpression()), !dbg !45
  %0 = load i32, i32* %x.addr, align 4, !dbg !46
  %add = add nsw i32 %0, 5, !dbg !47
  ret i32 %add, !dbg !48
}

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_ptr_call1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 9, type: !11, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/BASIC_ptr_call1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "p", scope: !9, file: !10, line: 10, type: !15)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!16 = !DILocation(line: 10, column: 9, scope: !9)
!17 = !DILocalVariable(name: "q", scope: !9, file: !10, line: 11, type: !18)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = !DISubroutineType(types: !20)
!20 = !{!13, !13}
!21 = !DILocation(line: 11, column: 9, scope: !9)
!22 = !DILocation(line: 13, column: 7, scope: !23)
!23 = distinct !DILexicalBlock(scope: !9, file: !10, line: 13, column: 7)
!24 = !DILocation(line: 13, column: 7, scope: !9)
!25 = !DILocation(line: 19, column: 3, scope: !26)
!26 = distinct !DILexicalBlock(scope: !23, file: !10, line: 13, column: 17)
!27 = !DILocalVariable(name: "x", scope: !9, file: !10, line: 21, type: !13)
!28 = !DILocation(line: 21, column: 7, scope: !9)
!29 = !DILocation(line: 21, column: 11, scope: !9)
!30 = !DILocalVariable(name: "y", scope: !9, file: !10, line: 22, type: !13)
!31 = !DILocation(line: 22, column: 7, scope: !9)
!32 = !DILocation(line: 22, column: 11, scope: !9)
!33 = !DILocation(line: 24, column: 14, scope: !9)
!34 = !DILocation(line: 24, column: 15, scope: !9)
!35 = !DILocation(line: 24, column: 20, scope: !9)
!36 = !DILocation(line: 24, column: 23, scope: !9)
!37 = !DILocation(line: 24, column: 24, scope: !9)
!38 = !DILocation(line: 0, scope: !9)
!39 = !DILocation(line: 24, column: 3, scope: !9)
!40 = !DILocation(line: 26, column: 3, scope: !9)
!41 = distinct !DISubprogram(name: "a", scope: !10, file: !10, line: 29, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocation(line: 29, column: 10, scope: !41)
!43 = distinct !DISubprogram(name: "c", scope: !10, file: !10, line: 30, type: !19, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocalVariable(name: "x", arg: 1, scope: !43, file: !10, line: 30, type: !13)
!45 = !DILocation(line: 30, column: 11, scope: !43)
!46 = !DILocation(line: 30, column: 22, scope: !43)
!47 = !DILocation(line: 30, column: 23, scope: !43)
!48 = !DILocation(line: 30, column: 15, scope: !43)
